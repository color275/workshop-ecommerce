from django.contrib import admin
from .models import *


class ProductAdmin(admin.ModelAdmin):
    def time_seconds(self, obj):
        return obj.last_update_time.strftime("%Y/%m/%d %H:%M:%S")
    time_seconds.admin_order_field = 'last_update_time'
    time_seconds.short_description = 'last_update_time'    

    list_display = ('name', 'category', 'price', 'time_seconds')
    list_filter = ('category',)
    search_fields = ('name', 'category')
    ordering = ('-last_update_time',)


    
admin.site.register(Product, ProductAdmin)


class UserAdmin(admin.ModelAdmin):
    def time_seconds(self, obj):
        return obj.last_update_time.strftime("%Y/%m/%d %H:%M:%S")
    time_seconds.admin_order_field = 'last_update_time'
    time_seconds.short_description = 'last_update_time'    

    list_display = ('name','phone_number','age','gender','address','time_seconds',)
    search_fields = ('name',)
    ordering = ('-last_update_time',)

admin.site.register(User, UserAdmin)

class OrderAdmin(admin.ModelAdmin):
    def time_seconds(self, obj):
        return obj.last_update_time.strftime("%Y/%m/%d %H:%M:%S")
    time_seconds.admin_order_field = 'last_update_time'
    time_seconds.short_description = 'last_update_time'    

    list_display = ('id','cust_id','prd_id','promo_id','order_cnt','order_price','order_dt','time_seconds',)
    ordering = ('-last_update_time',)

admin.site.register(Order, OrderAdmin)


