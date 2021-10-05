from rest_framework import serializers
from .models import Subscribes
from django.contrib.auth import get_user_model


User = get_user_model()

class UserSerializer(serializers.ModelSerializer):
    is_subscribed = serializers.SerializerMethodField(read_only=True)

    def get_is_subscribed(self, obj):
        return Subscribes.objects.filter(
            subscriber=self.context['request'].user, subscribe_on=obj
        ).exists()

    class Meta:
        fields = (
            "email", "id", "username", "first_name", "last_name",
            "is_subscribed")
        model = User
