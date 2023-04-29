import datetime
import logging
import os
import json
import random

class NginxAccessLogMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        
        self.log_file_path = '/var/log/ecommerce/access.log'

    def __call__(self, request):
        response = self.get_response(request)


        # {"remote_addr": "182.219.36.124"
        # "remote_username": "AWS"
        # "remote_userid": 2
        # "time_local": "2023-04-14 23:29:06.900576"
        # "request_line": "GET /product_detail/2/ HTTP/HTTP/1.1"
        # "status": 302
        # "body_bytes_sent": "-"
        # "http_referer": "http://www.facebook.com"
        # "http_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTMLlike Gecko) Chrome/111.0.0.0 Safari/537.36"}

        with open(self.log_file_path, 'a') as f:
            # extract information from request and response objects
            remote_addr = request.META.get('HTTP_X_FORWARDED_FOR', request.META.get('REMOTE_ADDR'))
            remote_username = request.user.username
            remote_userid = request.user.id
            time_local = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S.%f')
            
            servicePrdId = request.get_full_path().split("/")

            page = servicePrdId[1]
            prd_id = None
            if page in ['login','admin']  :
                return response
            elif len(servicePrdId) ==  4 :
                prd_id = int(servicePrdId[2])
            elif len(servicePrdId) ==  3 :
                page = servicePrdId[1]
                
            
            
            # request_url = request.get_full_path()  # 요청 URL을 가져옵니다.
            request_line = f'{request.method} {request.get_full_path()} HTTP/{request.META.get("SERVER_PROTOCOL")}'
            status = response.status_code
            body_bytes_sent = response.get('Content-Length', '-')
            
            referer_list = [
                'http://www.google.com',
                'http://www.facebook.com',
                'http://www.myweb.com',
                'http://www.yahoo.com',
                'http://www.bing.com',
            ]
            referer_list_w = [60,20,10,5,5]
            http_referer = random.choices(referer_list, referer_list_w)[0]
            http_user_agent = request.META.get('HTTP_USER_AGENT', '-')

            if 'ELB-HealthChecker' in http_user_agent :
                return response

            log_dict = {
            'remote_addr': remote_addr,
            'remote_username': remote_username,
            'page': page,
            'cust_id': remote_userid,
            'prd_id': prd_id,
            'timestamp': time_local,
            'request_line': request_line,
            'status': status,
            'body_bytes_sent': body_bytes_sent,
            'http_referer': http_referer,
            'http_user_agent': http_user_agent
            }
        
            log_msg = json.dumps(log_dict) + '\n'
            
            
            f.write(log_msg)


        return response
