from django.contrib.auth import get_user_model
from django.core.validators import MinValueValidator
from django.db import models
from django.utils.translation import gettext_lazy as _

User = get_user_model()


class Ingredients(models.Model):
    name = models.CharField(verbose_name=_("Ingredient's name"), max_length=200)
    measurement_unit = models.CharField(verbose_name=_("Measurement unit"))


class Tags(models.Model):
    name = models.CharField(verbose_name=_("Tag's name"), max_length=200)
    color = models.CharField(verbose_name=_('HEX cod for tag color'),
                             max_length=7)
    slug = models.SlugField(verbose_name=_('Slug'), max_length=200)


class Recipes(models.Model):
    ingredients = models.ManyToManyField(Ingredients)
    author = models.ForeignKey(User, verbose_name=_("Recipe's author"),
                               on_delete=models.SET_NULL)
    tags = models.ManyToManyField(Tags, verbose_name=_("Recipe's tags"),
                                  blank=True)
    image = models.ImageField(verbose_name=_("Recipe's image"))
    name = models.CharField(verbose_name="Recipe's name", max_length=200)
    text = models.TextField(verbose_name="Recipe's description")
    cooking_time = models.IntegerField(
        verbose_name=_("Time for cooking (in minutes)"),
        validators=[MinValueValidator(1)])


class Subscribe(models.Model):
    pass


class Favorites:
    pass


class ShopingCard(models.Model):
    pass
