# from rest_framework import serializers
# from .models import LocationModel, UserModel, OrderModel
#
# # Существующий сериализатор
# class LocationSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = LocationModel
#         fields = '__all__'
#
# # Новый сериализатор для заказов
# class OrderModelSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = OrderModel
#         fields = '__all__'
#
# # Новый сериализатор для пользователя с заказами
# class UserModelSerializer(serializers.ModelSerializer):
#     orders = OrderModelSerializer(many=True, read_only=True)
#
#     class Meta:
#         model = UserModel
#         fields = '__all__'
