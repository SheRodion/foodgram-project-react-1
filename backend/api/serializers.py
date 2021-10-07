from rest_framework import serializers, validators
from .models import Subscribes, Tags, Recipes, Favorites, ShoppingCard
from django.contrib.auth import get_user_model
from rest_framework.exceptions import ValidationError


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
            )]

    def validate(self, data):
        print(data["subscribe_on"])
        print(self.context['request'].user)
        if data["subscribe_on"] == self.context["request"].user:
            raise ValidationError("User can't follow himself")
        return data

class RecipesSerializer(serializers.ModelSerializer):
    is_favorited = serializers.SerializerMethodField()
    is_in_shopping_cart = serializers.SerializerMethodField()

    def get_is_favorited(self, obj):
        return Favorites.objects.filter(owner=self.context['request'].user, recipes__in=[obj.pk]).exists()

    def get_is_in_shopping_cart(self, obj):
        return ShoppingCard.objects.filter(user=self.context['request'].user, ingredients__in=[obj.pk]).exists()

    class Meta:
        model = Recipes
        fields = '__all__'
