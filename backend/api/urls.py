from django.urls import include, path, re_path
from rest_framework import routers

from . import views as vs

router_v1 = routers.DefaultRouter()

router_v1.register('subscribes', vs.SubscribesViewSet, basename='subs')
router_v1.register('recipes', vs.RecipesView, basename='recipes')
router_v1.register('tags', vs.TagsViewSet, basename='tags')
router_v1.register(
    'ingredients', vs.IngredientsViewSet, basename='ingredients'
)

urlpatterns = [
    path(
        'recipes/download_shopping_cart/',
        vs.download_shopping_card,
        name='download_shopping_card',
    ),
    re_path('', include(router_v1.urls)),
    path(
        'recipes/<int:pk>/shopping_cart/',
        vs.get_or_delete_obj,
        {'model': 'ShoppingCard'},
        name='shopping_cart',
    ),
    path(
        'recipes/<int:pk>/favorite/',
        vs.get_or_delete_obj,
        {'model': 'Favorites'},
        name='favorites',
    ),
]
