__all__ = ['Test']

import json

from rest_framework.views import APIView
from django.http import JsonResponse
from rest_framework.request import Request
from rest_framework import serializers, status
import pymongo
from bson import json_util


class Test(APIView):
    def get(self, request: Request):
        return JsonResponse({'status': 'Success'},
                            status=status.HTTP_200_OK)
