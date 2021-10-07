from django.contrib.auth import get_user_model
from rest_framework import permissions, viewsets
from rest_framework.decorators import action
from rest_framework.response import Response

from api.models import Tags, Subscribes, Recipes
from api.serializers import SubscribesSerializer, RecipesSerializer


class TagModelViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Tags.objects.all()
    model = Tags
    serializer_class = None
    pagination_class = None

class SubscribesViewset(viewsets.ModelViewSet):
    queryset = Subscribes.objects.all()
    model = Subscribes
    serializer_class = SubscribesSerializer
    pagination_class = None

class RecipesView(viewsets.ModelViewSet):
    queryset = Recipes.objects.all()
    model = Recipes
    serializer_class = RecipesSerializer

