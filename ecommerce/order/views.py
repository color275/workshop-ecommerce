
# Create your views here.
from django.shortcuts import render
from .models import *
from django.db.models import Sum
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
import boto3
from django.contrib.humanize.templatetags.humanize import intcomma
# import logging
from logging.handlers import RotatingFileHandler
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.shortcuts import render

@login_required
def home(request):
    return redirect('product_list')

@login_required
def logout_view(request):
    print("logout")
    logout(request)
    return redirect('login')






def product_detail(request, product_id):
    return redirect('product_list')

def product_basket(request, product_id):
    return redirect('product_list')

# def product_order(request, product_id):
#     return redirect('product_list')

from django.shortcuts import get_object_or_404, redirect, render
from datetime import date
import random
# from .models import Product, Order

def product_order(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    
    if request.method == 'GET':
        order_cnt = random.choice([1,2,3,4])
        promo_id = ""
        order_dt = date.today().strftime('%Y%m%d')
        order_price = product.price * int(order_cnt)
        
        # retrieve user information from the request or session
        user = request.user

        # create a new order object and save to the database
        order = Order.objects.create(
            cust_id=user,
            prd_id=product,
            promo_id=promo_id,
            order_cnt=order_cnt,
            order_price=order_price,
            order_dt=order_dt,
        )
    return redirect('product_list')



@login_required
def order_list(request):
    orders = Order.objects.select_related('cust_id', 'prd_id').order_by('-last_update_time')[:50]
    total_order_price = orders.aggregate(Sum('order_price'))['order_price__sum'] or 0
    return render(request, 'order_list.html', {'orders': orders, 'total_order_price': total_order_price})

@login_required
def customer_list(request):
    customers = User.objects.all()
    context = {'customers': customers}
    return render(request, 'customer_list.html', context)

@login_required
def product_list(request):
    products = Product.objects.all()
    context = {'products': products}
    return render(request, 'product_list.html', context)

@login_required
def get_recommendations(user_id):
    personalizeRt = boto3.client('personalize-runtime', region_name='ap-northeast-2')
    response = personalizeRt.get_recommendations(
        campaignArn='arn:aws:personalize:ap-northeast-2:531744930393:campaign/ecommerce-campaign',
        userId=user_id,
        numResults=10
    )
    print(response)
    recommended_items = [item for item in response['itemList']]
    print(recommended_items)
    return recommended_items



@login_required
def recommend_list(request):
    if request.is_ajax() and request.method == 'POST':
        # ajax POST 요청 처리
        customer_id = request.POST.get('data')
        print(customer_id)
        # 입력 데이터 처리
        recommended_items = get_recommendations(customer_id)
        
        scores = []
        recommended_products = []
        for k in recommended_items :
            recommended_products.append(Product.objects.filter(prd_id = k['itemId']))
            scores.append(k['score'])


        # recommended_products = Product.objects.filter(prd_id__in=recommended_items)
        customer = Customer.objects.get(cust_id=customer_id)
        customer_name = customer.name

        print(recommended_products)

        recommended_product_list = []
        for i, product in enumerate(recommended_products):
            recommended_product_list.append({
                'prd_id': product[0].prd_id,
                'name': product[0].name,
                'category': product[0].category,
                'price': intcomma(product[0].price),
                'score' : scores[i]
            })
        
        data = {
            'recommended_products': recommended_product_list,
            'customer_name': customer_name
        }       

        # return JsonResponse({'recommended_products': recommended_product_list})
        return JsonResponse(data)

    # GET 요청이나 ajax가 아닌 POST 요청 처리
    return render(request, 'recommend_list.html')        