from django.contrib import admin
from django.utils.translation import gettext_lazy as _
from .models import User

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('username',)
    empty_value_display = _('-empty-')
    search_fields = ('username',)
