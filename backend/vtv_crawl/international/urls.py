from django.urls import path
from international.services.test.test import Test
from international.services.get_list.view import GetListNew
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
from international.services.register.view import UserRegisterView

urlpatterns = [
    path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('register/', UserRegisterView.as_view(), name='user_register'),
    path('test/', Test.as_view()),
    path('get-list/', GetListNew.as_view()),
]