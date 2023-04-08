from django.urls import path
from .views import *
from django.contrib.auth.views import LoginView

urlpatterns = [
    path('', product_list, name='product_list'),
    path('orders/', order_list, name='order_list'),
    path('customer/', customer_list, name='customer_list'),
    path('product/', product_list, name='product_list'),
    path('product_detail/<int:product_id>/', product_detail, name='product_detail'),
    path('product_basket/<int:product_id>/', product_basket, name='product_basket'),
    path('product_order/<int:product_id>/', product_order, name='product_order'),
    path('recommend/', recommend_list, name='recommend_list'),
    path('login/', LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', logout_view, name='logout'),
]
