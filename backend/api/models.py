from colorfield.fields import ColorField
from django.contrib.auth import get_user_model
from django.core.validators import MinValueValidator
from django.db import models
from django.utils.translation import gettext_lazy as _

User = get_user_model()


class Ingredients(models.Model):
    name = models.CharField(
        verbose_name=_("Ingredient's name"), max_length=200
    )
    measurement_unit = models.CharField(
        verbose_name=_("Measurement unit"), max_length=200
    )

    class Meta:
        verbose_name = _('Ingredients')
        ordering = ('name',)

    def __str__(self) -> str:
        return self.name


class Tags(models.Model):
    name = models.CharField(verbose_name=_("Tag's name"), max_length=200)
    color = ColorField(max_length=7, verbose_name="Hex code for tag color")
    slug = models.SlugField(verbose_name=_('Slug'), max_length=200)

    class Meta:
        verbose_name = _('Tags')
        ordering = ('name',)

    def __str__(self) -> str:
        return self.name


class Recipes(models.Model):
    ingredients = models.ManyToManyField(Ingredients, through='RecipeIngredient')
    author = models.ForeignKey(
        User,
        verbose_name=_("Recipe's author"),
        on_delete=models.SET_NULL,
        null=True,
        related_name='author'
    )
    tags = models.ManyToManyField(
        Tags, verbose_name=_("Recipe's tags"), blank=True
    )
    image = models.ImageField()
    name = models.CharField(verbose_name="Recipe's name", max_length=200)
    text = models.TextField(verbose_name="Recipe's description")
    cooking_time = models.IntegerField(
        verbose_name=_("Time for cooking (in minutes)"),
        validators=[MinValueValidator(1)],
    )

    class Meta:
        verbose_name = _('Recipes')
        ordering = ('name',)

    def __str__(self) -> str:
        return self.name


class RecipeIngredient(models.Model):
    ingredients = models.ForeignKey(
        Ingredients,
        related_name='ingredient',
        on_delete=models.CASCADE,
        verbose_name='Ingredient',
    )
    recipes = models.ForeignKey(
        Recipes,
        related_name='recipe',
        on_delete=models.CASCADE,
        verbose_name='Recipe',
    )
    amount = models.IntegerField(
        validators=[MinValueValidator(1)],
        verbose_name='Amount of recipe ingredient',
    )

    class Meta:
        verbose_name = _('Recipe ingredient')

    def __str__(self):
        return _('Ingredients for recipe {}').format(self.recipes.name)


class Subscribes(models.Model):
    subscriber = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        verbose_name=_('subscriber'),
        related_name='subscriber',
    )
    subscribe_on = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        verbose_name=_('subscribing user'),
        related_name='subscribe_on',
    )

    class Meta:
        verbose_name = "Follow"
        constraints = [
            models.UniqueConstraint(
                fields=['subscriber', 'subscribe_on'], name='unique_subscribe'
            )
        ]

    def __str__(self) -> str:
        return f"{self.subscriber} subscribed on {self.subscribe_on}"


class Favorites(models.Model):
    owner = models.ForeignKey(
        User,
        verbose_name=_("User's list of favorite recipes"),
        on_delete=models.CASCADE,
    )
    recipes = models.ManyToManyField(
        Recipes, verbose_name=_("User's favorites recipes")
    )

    class Meta:
        verbose_name = _('List of favorite recipes')
        ordering = ('recipes__name',)


class ShoppingCard(models.Model):
    recipe = models.ManyToManyField(
        Recipes, verbose_name=_('Recipe for shopping card')
    ,related_name='shopping_card')
    user = models.ForeignKey(
        User,
        verbose_name=_("User's shopping card"),
        on_delete=models.CASCADE,
        related_name='shopping_card',
    )

    class Meta:
        verbose_name = _('Shopping card')

    def __str__(self) -> str:
        return _("{}'s shopping card").format(self.user.username)
