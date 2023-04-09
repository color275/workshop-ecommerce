# locust -f locustfile.py -H http://localhost:8000 --headless -u 10 -r 10 -t 5m
# -u 10 : 10 명의 사용자
# -r 10 : 10 명씩 증가
# -t 5m : 5분 동안

from locust import HttpUser, between, task
import re
import random



class MyUser(HttpUser):
    wait_time = between(1, 5)
    api = [
            '/product_order',
            '/product_detail',
            '/product_basket',
           ]
    api_w = [10,70,20]
    users = [
                'acoe',
                'anminji',
                'areum31',
                'bagminji',
                'bagseongsu',
                'bcoe',
                'bhwang',
                'bjin',
                'boram14',
                'ci',
                'cno',
                'coesunog',
                'donghyeonbag',
                'ebag',
                'eunjeonggweon',
                'eunjigang',
                'eunyeongbag',
                'eunyeonggwag',
                'gangjinho',
                'gangyeonghyi',
                'gcoe',
                'ggim',
                'gimeunjeong',
                'gimgeonu',
                'gimjia',
                'gimjieun',
                'gimjihun',
                'gimmigyeong',
                'gimyeonghyi',
                'gimyeweon',
                'gyeonghyi90',
                'gyeonghyigim',
                'gyeongsucoe',
                'gyeongsuggim',
                'hayunseo',
                'hwangseoyeon',
                'hyeonjungim',
                'hyeonsug05',
                'ieungyeong',
                'ieunju',
                'igim',
                'ijiyeon',
                'ijongsu',
                'imminjae',
                'isubin',
                'jeongho42',
                'jeonghun49',
                'jeongnaman',
                'jeongsubag',
                'jeongsubin',
                'jihugim',
                'jimingang',
                'lan',
                'li',
                'mgang',
                'mhan',
                'mijeongbag',
                'minjungo',
                'minseobaeg',
                'misugan',
                'ocoe',
                'ogo',
                'ogsun78',
                'ohwang',
                'qgim',
                'sangceol56',
                'sangho53',
                'sanghobae',
                'sanghunbag',
                'sbag',
                'seonghoi',
                'seonghyeonhwang',
                'seongjin88',
                'seongsugim',
                'seoyejun',
                'seoyeongim',
                'seoyun68',
                'subin06',
                'subin58',
                'sujini',
                'ugim',
                'vcoe',
                'vgim',
                'vi',
                'yeeun72',
                'yeonghomun',
                'yeonghwanbag',
                'yeongjin27',
                'yeongjingim',
                'yeongsig43',
                'yeongsu18',
                'yujin78',
                'yunseojo',
                'yunseonghyeon',
                'zi',
                'zyang',
                ]
    product_num = 10
    csrf_token = ""

    def on_start(self):
        # Authenticate user
        self.csrf_token = self.get_csrf_token()
        if self.csrf_token != "":
            # Login user
            self.login()

    def get_csrf_token(self):
        response = self.client.get("/login/")
        csrf_regex = r'name="csrfmiddlewaretoken" value="(.+)"'
        csrf_token = re.findall(csrf_regex, response.text)
        if len(csrf_token) > 0:
            return csrf_token[0]
        else:
            return ""

    def login(self):
        self.username = self.users.pop(0)
        headers = {"Referer": "/login/"}
        data = {"username": self.username, "password": "1234", "csrfmiddlewaretoken": self.csrf_token}
        response = self.client.post("/login/", data=data, headers=headers)
        
        if response.status_code == 200 :
            print("## [{}] User Login Success!!".format(self.username))

        return response

    @task
    def my_api_call(self):

        div_item = ['click','basket','review','order']
        weights = [80,10,6,2]
        select_api = random.choices(self.api, self.api_w)[0]

        select_product = random.randint(1, self.product_num)
        
        # print("{}/{}/".format(select_api, select_product))
        response = self.client.get("{}/{}/".format(select_api, select_product), headers={'X-CSRFToken': self.csrf_token})
        # if response.status_code == 200:
        #     print("## [{}] User {}/{}/ API call successful".format(self.username, select_api, select_product))
        # else:
        #     print("API call failed")
