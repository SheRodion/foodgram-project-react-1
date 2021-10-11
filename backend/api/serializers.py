from collections import OrderedDict
from django.core.exceptions import ObjectDoesNotExist

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
    id = serializers.IntegerField()
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
            i = get_object_or_404(Ingredients, id=ingr['id'])
            RecipeIngredient.objects.create(recipes=recipe, ingredients=i,
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
        # for nested_obj in ({'ingredients': 'recipe'}, {'tags': 'tags'}):
        #     for k,v in nested_obj.items():
        #         updated
        #         nested_serializer = self.fields[k]
        #         nested_instance = getattr(instance, k)
        #         nested_update_data = validated_data.pop(v)
        #         nested_serializer.update(nested_instance, nested_update_data)
        # return super(RecipesSerializer, self).update(instance, validated_data)

    def get_is_favorited(self, obj):
        return Favorites.objects.filter(
            owner=self.context['request'].user, recipes__in=[obj.pk]
        ).exists()

    def get_is_in_shopping_cart(self, obj):
        return ShoppingCard.objects.filter(
            user=self.context['request'].user, ingredients__in=[obj.pk]
        ).exists()

    class Meta:
        model = Recipes
        fields = '__all__'
