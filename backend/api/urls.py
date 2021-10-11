from django.urls import path, include, re_path
from rest_framework import routers
from . import views as vs

router_v1 = routers.DefaultRouter()

router_v1.register('subscribes', vs.SubscribesViewset, basename='subs')
router_v1.register('recipes', vs.RecipesView, basename='recipes')
router_v1.register('tags', vs.TagsViewSet, basename = 'tags')

urlpatterns = [
    re_path('', include(router_v1.urls))
]