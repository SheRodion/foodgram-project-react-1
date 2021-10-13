from django.contrib.auth import get_user_model
from rest_framework import permissions, viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import mixins
from rest_framework import generics
from rest_framework.decorators import api_view
from django.shortcuts import get_object_or_404
from django.http import Http404
from django.core.exceptions import ObjectDoesNotExist
from rest_framework import status
from reportlab.pdfgen import canvas
from django.http import HttpResponse
from django.db.models import Sum
from reportlab.lib.units import cm

from api.models import Tags, Subscribes, Recipes, ShoppingCard, Ingredients
from api.serializers import SubscribesSerializer, RecipesSerializer, TagsSerializer, RecipeShoppingCardSerializer


class TagsViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Tags.objects.all()
    model = Tags
    serializer_class = TagsSerializer
    pagination_class = None

class SubscribesViewSet(viewsets.ModelViewSet):
    queryset = Subscribes.objects.all()
    model = Subscribes
    serializer_class = SubscribesSerializer
    pagination_class = None

class RecipesView(viewsets.ModelViewSet):
    queryset = Recipes.objects.all()
    model = Recipes
    serializer_class = RecipesSerializer

@api_view(['GET', 'DELETE'])
def shopping_card(request, **kwargs):
    id_recipe = kwargs.get('pk')
    recipe = get_object_or_404(Recipes, id=id_recipe)
    recipe_data = {
        'id': recipe.id,
        'name': recipe.name,
        'image': request.build_absolute_uri(recipe.image.url),
        'cooking_time': recipe.cooking_time
    }

    if request.method == 'GET':
        obj, created = ShoppingCard.objects.get_or_create(user=request.user)
        if created:
            obj.recipe.add(recipe)
            return Response(recipe_data, status=status.HTTP_201_CREATED)
        if obj.recipe.filter(pk=recipe.pk).exists():
            return Response(status=status.HTTP_400_BAD_REQUEST)
        obj.recipe.add(recipe)
        return Response(recipe_data, status=status.HTTP_201_CREATED)
    elif request.method == 'DELETE':
        try:
            obj = ShoppingCard.objects.get(recipe=recipe, user=request.user)
            obj.delete()
            return Response(data=None, status=status.HTTP_204_NO_CONTENT)
        except ObjectDoesNotExist:
            raise Http404

@api_view(['GET'])
def download_shopping_card(request, **kwargs):
    result_ingr = Recipes.objects.filter(shopping_card__user=request.user).order_by('ingredients__name').values('ingredients__name', 'ingredients__measurement_unit').annotate(total=Sum('recipe__amount'))
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="somefilename.pdf"'
    p = canvas.Canvas(response)
    textobject = p.beginText(2 * cm, 29.7 * cm - 2 * cm)
    for result in result_ingr:
        textobject.textLine(f"{result['ingredients__name']}, {result['ingredients__measurement_unit']} --- {result['total']}")
    p.drawText(textobject)
    p.showPage()
    p.save()
    return response





