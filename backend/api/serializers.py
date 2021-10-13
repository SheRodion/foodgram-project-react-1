from collections import OrderedDict
from django.core.exceptions import ObjectDoesNotExist
from drf_extra_fields.fields import Base64ImageField
from users.serializers import CustomUserSerializer
from django.contrib.auth import get_user_model

from rest_framework import serializers, validators
from .models import (
    Subscribes,
    Tags,
    Recipes,
    Favorites,
    ShoppingCard,
    RecipeIngredient,
    Ingredients
)
from users.serializers import CustomUserSerializer
from rest_framework.exceptions import ValidationError
from django.shortcuts import get_object_or_404


class TagsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tags
        fields = '__all__'

    def to_internal_value(self, data):
        try:
            tag = Tags.objects.get(id=data)
        except ObjectDoesNotExist:
            raise ValidationError('Wrong tag id')
        return tag


class SubscribesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subscribes
        fields = '__all__'
        validators = [
            validators.UniqueTogetherValidator(
                queryset=Subscribes.objects.all(),
                fields=("subscriber", "subscribe_on"),
            )
        ]

    def validate(self, data):
        if data["subscribe_on"] == self.context["request"].user:
            raise ValidationError("User can't follow himself")
        return data


class RecipeIngredientSerializer(serializers.ModelSerializer):
    id = serializers.PrimaryKeyRelatedField(source='ingredients.id', queryset=Ingredients.objects.all())
    name = serializers.ReadOnlyField(source='ingredients.name')
    measurement_unit = serializers.ReadOnlyField(
        source='ingredients.measurement_unit')
    amount = serializers.IntegerField()

    class Meta:
        model = RecipeIngredient
        exclude = ('recipes', 'ingredients')
        extra_kwargs = {'id': {'read_only': False}}


class RecipesSerializer(serializers.ModelSerializer):
    is_favorited = serializers.SerializerMethodField()
    is_in_shopping_cart = serializers.SerializerMethodField()
    ingredients = RecipeIngredientSerializer(many=True, source='recipe')
    tags = TagsSerializer(many=True)
    author = CustomUserSerializer(read_only=True)
    image = Base64ImageField(use_url=True)

    def create(self, validated_data):
        user = None
        request = self.context.get("request")
        if request and hasattr(request, "user"):
            user = request.user
        ingredients = validated_data.pop('recipe')
        tags = validated_data.pop('tags')
        recipe = Recipes.objects.create(author=user, **validated_data)
        for tag in tags:
            recipe.tags.add(tag)
        for ingr in ingredients:
            RecipeIngredient.objects.create(recipes=recipe, ingredients=ingr['ingredients']['id'],
                                            amount=ingr['amount'])
        return recipe

    def update(self, instance, validated_data):

        tags_updated = validated_data.pop('tags')
        ingr_updated = validated_data.pop('recipe')

        for item in validated_data:
            if Recipes._meta.get_field(item):
                setattr(instance, item, validated_data[item])
            RecipeIngredient.objects.filter(recipes=instance).delete()
        for tag in tags_updated:
            instance.tags.add(tag)
        for ingr in ingr_updated:
            i = get_object_or_404(Ingredients, id=ingr['id'])
            RecipeIngredient.objects.create(recipes=instance, ingredients=i,
                                            amount=ingr['amount'])
        instance.save()
        return instance

    def get_is_favorited(self, obj):
        return Favorites.objects.filter(
            user=self.context['request'].user, recipe__in=[obj.pk]
        ).exists()

    def get_is_in_shopping_cart(self, obj):
        return ShoppingCard.objects.filter(
            user=self.context['request'].user, recipe__in=[obj.pk]
        ).exists()

    class Meta:
        model = Recipes
        fields = '__all__'



class RecipeShortSerializer(RecipesSerializer):
    class Meta:
        model = Recipes
        fields = ('id', 'name', 'image', 'cooking_time')


class UserSubscribeSerializer(CustomUserSerializer):
    recipes = RecipeShortSerializer(source='author', read_only=True, many=True)
    recipes_count = serializers.SerializerMethodField(read_only=True)

    def get_recipes_count(self, obj):
        return Recipes.objects.filter(author=obj).count()

    class Meta:
        model = get_user_model()
        fields = ('email', 'id', 'username', 'first_name', 'last_name', 'is_subscribed', 'recipes', 'recipes_count')


class IngredientsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ingredients
        fields = '__all__'
