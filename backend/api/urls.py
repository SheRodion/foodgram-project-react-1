from django.urls import path, include, re_path
from rest_framework import routers
from . import views as vs
from rest_framework.urlpatterns import format_suffix_patterns

router = routers.DefaultRouter()

router.register('subscribes', vs.SubscribesViewSet, basename='subs')
router.register('recipes', vs.RecipesView, basename='recipes')
router.register('tags', vs.TagsViewSet, basename='tags')
router.register('ingredients', vs.IngredientsViewSet, basename='ingredients')


urlpatterns = [
    path('recipes/download_shopping_cart/', vs.download_shopping_card, name='download_shopping_card'),
    re_path('', include(router.urls)),
    path('recipes/<int:pk>/shopping_cart/', vs.get_or_delete_obj, {'model': 'ShoppingCard'}, name='shopping_cart', ),
    path('recipes/<int:pk>/favorite/', vs.get_or_delete_obj, {'model': 'Favorites'}, name='favorites')

]