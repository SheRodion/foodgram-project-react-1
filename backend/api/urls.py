from django.urls import path, include, re_path
from rest_framework import routers
from . import views as vs
from rest_framework.urlpatterns import format_suffix_patterns

router_v1 = routers.DefaultRouter()

router_v1.register('subscribes', vs.SubscribesViewSet, basename='subs')
router_v1.register('recipes', vs.RecipesView, basename='recipes')
router_v1.register('tags', vs.TagsViewSet, basename='tags')


urlpatterns = [
    path('recipes/download_shopping_cart/', vs.download_shopping_card, name='download_shopping_card'),
    re_path('', include(router_v1.urls)),
    path('recipes/<int:pk>/shopping_cart/', vs.shopping_card, name='shopping_cart'),

]