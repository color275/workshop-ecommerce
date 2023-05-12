# locust -f locustfile.py -H http://localhost:8000 --headless -u 10 -r 10 -t 5m
# -u 10 : 10 명의 사용자
# -r 10 : 10 명씩 증가
# -t 5m : 5분 동안

from locust import HttpUser, between, task
import re
import random



class MyUser(HttpUser):
    # wait_time = between(1, 5)
    wait_time = between(20, 30)
    api = [
            '/product_order',
            '/product_detail',
            '/product_basket',
            '/change_order_cnt',
           ]
    api_w = [10,70,15,5]
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
    users_w = [0.6636011223428091, 0.025156399624507886, 0.45220298437700934, 0.9486221188118408, 0.1995455303797088, 0.6455273558466226, 0.5368769454223783, 0.03635485450264664, 0.0721935925147913, 0.7543223224354748, 0.40181771292923785, 0.029408468608449145, 0.14951525893558004, 0.6146950857192637, 0.7826239489457352, 0.265895028824382, 0.7351876483791719, 0.44275419319636145, 0.9207724637570288, 0.06901654929541823, 0.137720933994963, 0.9307260532070811, 0.22065800357871568, 0.08273689904198367, 0.7320957996771928, 0.258171317057006, 0.6627436338633883, 0.3784915230721868, 0.22296384607016273, 0.496069012650596, 0.5226864046225612, 0.08153480949254932, 0.8950388001102207, 0.5569231077615614, 0.24959348129045866, 0.4979939059544811, 0.3481937030593484, 0.6655075517550838, 0.34256324806833605, 0.8734747944259618, 0.6828148886734118, 0.8561924027250826, 0.33242542660358654, 0.8883158133014792, 0.8075796183924288, 0.4334759689681369, 0.19574355862183512, 0.22887442721533247, 0.4167243565467065, 0.0690790004908689, 0.017498433205802244, 0.1376782606418876, 0.27601439618530843, 0.6790582808813225, 0.5816826608900306, 0.8278246894254623, 0.8699513793040462, 0.841462172623333, 0.7973149294782003, 0.1222011377620793, 0.08405913740571402, 0.8848043471103129, 0.37900934642176387, 0.3747228970386385, 0.6774516990367322, 0.27039293596273806, 0.9144111334245341, 0.46977966444503005, 0.21830970806729133, 0.1804543957366196, 0.11266293122175886, 0.9483802394280247, 0.7018412148637172, 0.2752313551861809, 0.805677869806206, 0.5282605664256512, 0.5060171353686457, 0.44751165847625074, 0.9706986894818039, 0.5312255237916427, 0.9222924936031706, 0.3974539955514793, 0.5953399124241513, 0.35214947649700046, 0.3675366240276543, 0.06634465185707261, 0.9238870993302922, 0.429958238303238, 0.536684452226398, 0.10113588304081211, 0.03586541154552969, 0.8991752465646619, 0.4797654475229387, 0.6272491515585723, 0.8441210933217655, 0.8270003254145543, 0.445286506083434, 0.3936831431330554]
    product = [ i+1 for i in range(20)]
    product_w = [0.0698274809060464, 0.40533637700905223, 0.6190843232936676, 0.10052464556061447, 0.45920623727387533, 0.03306971878363607, 0.2511832697466422, 0.6899167647931684, 0.2652516333178674, 0.11514790376539152, 0.13969229925813653, 0.7407731208414431, 0.2525476881096822, 0.5703539135718813, 0.20767897668845103, 0.7243688344405188, 0.9602627620052301, 0.6618681659068225, 0.049939982911558545, 0.3033568214973458]
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
        self.order_w = self.users_w.pop(0)
        headers = {"Referer": "/login/"}
        data = {"username": self.username, "password": "1234", "csrfmiddlewaretoken": self.csrf_token}
        response = self.client.post("/login/", data=data, headers=headers)
        
        # if response.status_code == 200 :
        #     print("## [{}] User Login Success!!".format(self.username))

        return response

    @task
    def my_api_call(self):

        # div_item = ['click','basket','review','order']
        # weights = [80*self.order_w,10*self.order_w,6*self.order_w,4*self.order_w]
        
        select_api = random.choices(self.api, self.api_w)[0]
        select_product = random.choices(self.product, self.product_w)[0]

        response = self.client.get("{}/{}/".format(select_api, select_product), headers={'X-CSRFToken': self.csrf_token})
        
        # if response.status_code == 200:
        #     print("## [{}] User {}/{}/ API call successful".format(self.username, select_api, select_product))
        # else:
        #     print("API call failed")
