from django.contrib import admin
from .models import Product
from .models import User

class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'category', 'price', 'last_update_time')
    list_filter = ('category',)
    search_fields = ('name', 'category')
    ordering = ('-last_update_time',)

admin.site.register(Product, ProductAdmin)


admin.site.register(User)