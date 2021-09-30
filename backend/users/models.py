from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _


class Users(AbstractUser):
    """Custom User model."""

    class Roles(models.TextChoices):
        """Custom roles for use custom permissions in api"""
        ADMIN = "admin", _("Administrator")
        USER = "user", _("Moderator")

    email = models.EmailField(_("email address"), unique=True)
    role = models.CharField(_("role"), choices=Roles.choices,
                            default=Roles.USER, max_length=30)
    first_name = models.CharField(_('first name'), max_length=150, unique=True)
    last_name = models.CharField(_('last name'), max_length=150, unique=True)

    @property
    def is_admin(self):
        if self.role == "admin" or self.is_superuser:
            return True

    @property
    def is_user(self):
        if self.role == "user":
            return True

    class Meta:
        ordering = ("username",)




