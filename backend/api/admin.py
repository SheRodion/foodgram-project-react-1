from django.contrib import admin
from django.utils.translation import gettext_lazy as _

from .models import (Favorites, Ingredients, Recipes, ShoppingCard, Subscribes,
                     Tags)


@admin.register(Recipes)
class RecipesAdmin(admin.ModelAdmin):
    list_display = ('author', 'name')
    empty_value_display = _('-empty-')
    search_fields = ('name', 'author')


@admin.register(Ingredients)
class IngredientsAdmin(admin.ModelAdmin):
    list_display = ('name',)
    empty_value_display = _('-empty-')
    search_fields = ('name', )


@admin.register(Tags)
class TagsAdmin(admin.ModelAdmin):
    list_display = ('name', 'color')
    empty_value_display = _('-empty-')
    search_fields = ('name', 'color')


@admin.register(Favorites)
class FavoritesAdmin(admin.ModelAdmin):
    list_display = ('owner', )
    empty_value_display = _('-empty-')
    search_fields = ('owner', )


@admin.register(ShoppingCard)
class ShoppingCardAdmin(admin.ModelAdmin):
    list_display = ('user', 'get_ingredients')
    empty_value_display = _('-empty-')
    search_fields = ('user', 'get_ingredients')

    @staticmethod
    def get_ingredients(obj):
        return '\n'.join([_.name for _ in obj.inredients.all()])



@admin.register(Subscribes)
class SubscribesAdmin(admin.ModelAdmin):
    list_display = ('subscriber', 'subscribe_on')
    empty_value_display = _('-empty-')
    search_fields = ('subscriber', 'subscribe_on')
