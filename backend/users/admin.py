from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.utils.translation import gettext_lazy as _

from .models import User


@admin.register(User)
class UserAdmin(UserAdmin):
    """Custom User model.

    It inherits from UserAdmin to who password in hashed view, not plain text
    """

    list_display = ('username',)
    empty_value_display = _('-empty-')
    search_fields = ('username',)
    list_filter = ('email', 'username')