from django.urls import path
from international.services.test import Test


urlpatterns = [
    path('test/', Test.as_view())
]