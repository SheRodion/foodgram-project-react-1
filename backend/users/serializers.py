from djoser.serializers import UserCreateSerializer, UserSerializer
from django.contrib.auth import get_user_model


class CustomUserCreateSerializer(UserCreateSerializer):
    class Meta:
        model = get_user_model()
        fields = ('email', 'username', 'first_name', 'last_name', 'password')

