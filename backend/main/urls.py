# from django.urls import path, include
# from rest_framework.routers import DefaultRouter
# from .views import LocationViewSet
# from . import views
#
# router = DefaultRouter()
# router.register(r'locations', LocationViewSet, basename='location')
#
# urlpatterns = [
#     path('api/', include(router.urls)),
#
#
#     # Пользователь
#     path('get-user/<int:user_id>/', views.get_user, name='get-user'),
#     path('get-user-phone-number/<str:phoneNumber>/', views.get_user_phoneNumber, name='get-user-phone-number'),
#     path('update-user/<int:user_id>/', views.update_user, name='update-user'),
#     path('add-user/', views.add_user, name='add-user'),
#
#     # Заказы
#     path('add-order/', views.add_order, name='add-order'),
#     path('add-order-user/<int:order_id>/<int:user_id>/', views.add_order_user, name='add-order-user'),
#
#     # Данные
#     path('branches/', views.branches_list_json, name='branches-list-json'),
#     path('products/', views.product_list_json, name='products-list-json'),
#     path('categories/', views.category_list_json, name='categories-list-json'),
#     path('poster/', views.poster_list_json, name='poster-list-json'),
#
#     # СМС
#     path('send-sms/', views.send_sms, name='send-sms'),
# ]
