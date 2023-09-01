from django.db import models

# Create your models here.
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    name = models.CharField(max_length=255, blank=True ,null=True)
    phone_number = models.CharField(max_length=20, blank=True ,null=True)
    age = models.IntegerField(blank=True ,null=True)
    gender = models.CharField(max_length=10, blank=True ,null=True)
    address = models.CharField(max_length=200, blank=True ,null=True)
    last_update_time = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'customer'
        verbose_name_plural = '고객(customer)'


class Product(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    img_path = models.CharField(max_length=255, blank=True ,null=True)
    category = models.CharField(max_length=255, null=True)
    price = models.IntegerField()
    last_update_time = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'product'
        verbose_name_plural = '상품(product)'
    
    def __str__(self):
        return self.name

class Order(models.Model):
    id = models.AutoField(primary_key=True)
    cust_id = models.ForeignKey(User, on_delete=models.DO_NOTHING, db_column='cust_id',)
    prd_id = models.ForeignKey(Product, on_delete=models.DO_NOTHING, db_column='prd_id',)
    promo_id = models.CharField(max_length=255, blank=True, null=True)
    order_cnt = models.IntegerField()
    order_price = models.IntegerField()
    order_dt = models.CharField(max_length=255)
    last_update_time = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'orders'
        verbose_name_plural = '주문(orders)'




