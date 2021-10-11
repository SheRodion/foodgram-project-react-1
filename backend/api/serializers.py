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
from rest_framework.exceptions import ValidationError
from django.shortcuts import get_object_or_404


class TagsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tags
        fields = '__all__'


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
    measurement_unit = serializers.ReadOnlyField(source='ingredients.measurement_unit')
    amount = serializers.IntegerField()
    class Meta:
        model = RecipeIngredient
        exclude = ('recipes', 'ingredients')
        # read_only = ('name', 'measurement_unit')
        extra_kwargs = {'id': {'read_only': False}}


class RecipesSerializer(serializers.ModelSerializer):
    is_favorited = serializers.SerializerMethodField()
    is_in_shopping_cart = serializers.SerializerMethodField()
    ingredients = RecipeIngredientSerializer(many=True, source='recipe')

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
            print(ingr)
            i = get_object_or_404(Ingredients, id=ingr['id'])
            print(i)
            RecipeIngredient.objects.create(recipes=recipe, ingredients=i, amount=ingr['amount'])
        return recipe

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


data = {"ingredients": [{"id": 1, "amount": 1}],
        "tags": [1],
        "image": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABAgMAAABieywaAAAACVBMVEUAAAD///9fX1/S0ecCAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAACklEQVQImWNoAAAAggCByxOyYQAAAABJRU5ErkJggg==",
        "name": "string",
        "text": "string",
        "cooking_time": 1
        }
