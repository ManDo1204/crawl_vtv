__all__ = ['Test']

from rest_framework.views import APIView
from django.http import JsonResponse
from rest_framework.request import Request
from rest_framework import serializers, status


class Test(APIView):
    def get(self, request: Request):
        return JsonResponse({
                    'message': 'It works!!'
                }, status=status.HTTP_200_OK)