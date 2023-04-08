import datetime
import logging
import os
import json

class NginxAccessLogMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        
        self.log_file_path = '/var/log/order/access.log'

    def __call__(self, request):
        response = self.get_response(request)

        with open(self.log_file_path, 'a') as f:
            # extract information from request and response objects
            remote_addr = request.META.get('HTTP_X_FORWARDED_FOR', request.META.get('REMOTE_ADDR'))
            remote_username = request.user.username
            remote_userid = request.user.id
            time_local = datetime.datetime.now().strftime('%d/%b/%Y:%H:%M:%S %z')
            # request_url = request.get_full_path()  # 요청 URL을 가져옵니다.
            request_line = f'{request.method} {request.get_full_path()} HTTP/{request.META.get("SERVER_PROTOCOL")}'
            status = response.status_code
            body_bytes_sent = response.get('Content-Length', '-')
            http_referer = request.META.get('HTTP_REFERER', '-')
            http_user_agent = request.META.get('HTTP_USER_AGENT', '-')

            log_dict = {
            'remote_addr': remote_addr,
            'remote_username': remote_username,
            'remote_userid': remote_userid,
            'time_local': time_local,
            # 'request_url': request_url,
            'request_line': request_line,
            'status': status,
            'body_bytes_sent': body_bytes_sent,
            'http_referer': http_referer,
            'http_user_agent': http_user_agent
            }
        
            log_msg = json.dumps(log_dict) + '\n'
            
            f.write(log_msg)


        return response
