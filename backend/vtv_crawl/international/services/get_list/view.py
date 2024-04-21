__all__ = ['GetListNew']


from rest_framework.views import APIView
from django.http import JsonResponse
from rest_framework.request import Request
from rest_framework import serializers, status
import pymongo
from rest_framework.permissions import IsAuthenticated


class GetListNew(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request: Request):
        connection_string = 'mongodb://manhdo:manhdo@manhdodb:27017/'
        try:
            client = pymongo.MongoClient(connection_string)
            db = client['vtv_news_db_dev']
            collection_name = db['thegioi_news']
            list_news = list(collection_name.find({}, {'_id': False}).sort('scraped_time',pymongo.DESCENDING))

        except Exception as e:
            return JsonResponse({
                'status': 'Fail',
                'error': e
            }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return JsonResponse(list_news,
            safe=False,
            status=status.HTTP_200_OK)
