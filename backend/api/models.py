from colorfield.fields import ColorField
from django.contrib.auth import get_user_model
from django.core.validators import MinValueValidator
from django.db import models
from django.utils.translation import gettext_lazy as _

User = get_user_model()


class Ingredients(models.Model):
    name = models.CharField(verbose_name=_("Ingredient's name"), max_length=200)
    measurement_unit = models.CharField(verbose_name=_("Measurement unit"),
                                        max_length=200)

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
    ingredients = models.ManyToManyField(Ingredients)
    author = models.ForeignKey(User, verbose_name=_("Recipe's author"),
                               on_delete=models.SET_NULL, null=True)
    tags = models.ManyToManyField(Tags, verbose_name=_("Recipe's tags"),
                                  blank=True)
    image = models.ImageField(verbose_name=_("Recipe's image"))
    name = models.CharField(verbose_name="Recipe's name", max_length=200)
    text = models.TextField(verbose_name="Recipe's description")
    cooking_time = models.IntegerField(
        verbose_name=_("Time for cooking (in minutes)"),
        validators=[MinValueValidator(1)])

    class Meta:
        verbose_name = _('Recipes')
        ordering = ('name',)

    def __str__(self) -> str:
        return self.name


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
    owner = models.ForeignKey(User,
                              verbose_name=_("User's list of favorite recipes"),
                              on_delete=models.CASCADE)
    recipes = models.ManyToManyField(Recipes,
                                     verbose_name=_("User's favorites recipes"))

    class Meta:
        verbose_name = _('List of favorite recipes')
        ordering = ('recipes__name',)


class ShoppingCard(models.Model):
    ingredients = models.ManyToManyField(Ingredients,
                                         verbose_name=_(
                                             'Ingredients for shopping card'))
    user = models.ForeignKey(User, verbose_name=_("User's shopping card"),
                             on_delete=models.CASCADE)

    class Meta:
        verbose_name = _('Shopping card')

    def __str__(self) -> str:
        return _("{}'s shopping card".format(self.user.name))
