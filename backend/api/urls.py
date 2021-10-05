from django.urls import path, include, re_path
from rest_framework import routers
from . import views as vs

router_v1 = routers.DefaultRouter()

router_v1.register('users', vs.UserModelViewSet, basename='users')

urlpatterns = [
    re_path('', include(router_v1.urls))
]