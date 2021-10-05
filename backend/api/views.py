from django.contrib.auth import get_user_model
from rest_framework import permissions, viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from .serializers import UserSerializer

User = get_user_model()


class UserModelViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    @action(methods=('GET',),
            detail=False, url_path='me')
    def users_me(self, request):

        serializer = self.get_serializer(request.user)
        return Response(serializer.data)
