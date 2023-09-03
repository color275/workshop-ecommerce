
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
import random
from django.conf import settings

import socket
from django.contrib import messages  



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
        promo = ['','PROMO001','PROMO002','PROMO003','PROMO004','PROMO005']
        promo_w = [70,15,8,4,2,1]
        promo_id = random.choices(promo, promo_w)[0]
        order_dt = date.today().strftime('%Y%m%d')
        order_price = product.price * int(order_cnt)
        
        # retrieve user information from the request or session
        user = request.user

        try:
            # create a new order object and save to the database
            order = Order.objects.create(
                cust_id=user,
                prd_id=product,
                promo_id=promo_id,
                order_cnt=order_cnt,
                order_price=order_price,
                order_dt=order_dt,
            )
            messages.success(request, '주문이 성공적으로 생성되었습니다.')  # 성공 메시지 추가
        except Exception as e:
            messages.error(request, f'주문 생성 중 오류 발생: {str(e)}')  # 에러 메시지 추가

    return redirect('product_list')



@login_required
def order_list(request):
    orders = Order.objects.select_related('cust_id', 'prd_id').order_by('-last_update_time')[:50]
    total_order_price = orders.aggregate(Sum('order_price'))['order_price__sum'] or 0
    context = {
                'orders': orders, 
                'total_order_price': total_order_price, 
                'hostname': socket.gethostname()
            }
    
    return render(request, 'order_list.html', context)

@login_required
def customer_list(request):
    customers = User.objects.all()
    context = {'customers': customers,
               'hostname': socket.gethostname()
                }
    return render(request, 'customer_list.html', context)

@login_required
def product_list(request):

    personalize_arn = getattr(settings, 'PERSONALIZE_ARN', None)

    products = Product.objects.all()
    
    if len(personalize_arn) > 0 :
        print("personalize recommend")
        gr = get_recommendations(str(request.user.id), personalize_arn)
        recommend_ids = [ i + 1 for i in range(20 )]
        recommend_ids.reverse()
        products = sorted(products, key=lambda x: recommend_ids.index(x.id))
    else :
        print("normal recommend")

    context = {'products': products, 
               'personalize_arn':personalize_arn,
               'hostname': socket.gethostname()
               }
    return render(request, 'product_list.html', context)

def get_recommendations(user_id, personalize_arn):
    personalizeRt = boto3.client('personalize-runtime', region_name='ap-northeast-2')
    response = personalizeRt.get_recommendations(
        campaignArn=personalize_arn,
        userId=str(user_id),
        numResults=10
    )
    recommended_items = [item for item in response['itemList']]    
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


def change_order_cnt(request, product_id):

    if Order.objects.exists():
        # max_id = Order.objects.latest('id').id
        max_id = 1
        order = Order.objects.get(id=max_id)

        price = int(order.order_price / order.order_cnt)

        new_order_cnt = order.order_cnt + 1

        # print("## {} : {}".format(max_id, new_order_cnt))

        order.order_cnt = new_order_cnt
        order.order_price = price * new_order_cnt
        order.save()

    return redirect('product_list')
