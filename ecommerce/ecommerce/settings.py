"""
Django settings for ecommerce project.

Generated by 'django-admin startproject' using Django 3.2.18.

For more information on this file, see
https://docs.djangoproject.com/en/3.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.2/ref/settings/
"""

from pathlib import Path

import os
import boto3
import environ

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

env = environ.Env(DEBUG=(bool, True))
environ.Env.read_env(
    env_file=os.path.join(BASE_DIR, '.env')
)

PERSONALIZE_ARN = env('PERSONALIZE_ARN')

ENV_ENGINE = env('ENGINE')
ENV_NAME = env('NAME')
ENV_DBUSER = env('DBUSER')
ENV_PASSWORD = env('PASSWORD')
ENV_HOST = env('HOST')
ENV_PORT = env('PORT')

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-pfc7nub_sq=zi^k0r1)2j!i3gwvzj4ok@3lf276tvh&x*lykh*'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ["*"]


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.humanize',
    'order',
    'django_filters',
    'sorl.thumbnail',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'ecommerce.middlewares.NginxAccessLogMiddleware',
    
]

ROOT_URLCONF = 'ecommerce.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'ecommerce.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases
DATABASES = {
    'default': {
        'ENGINE': ENV_ENGINE,
        'NAME': ENV_NAME,
        'USER': ENV_DBUSER,
        'PASSWORD': ENV_PASSWORD,
        'HOST': ENV_HOST,
        'PORT': ENV_PORT,
     }
}



# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

# TIME_ZONE = 'UTC'
TIME_ZONE = 'Asia/Seoul'


USE_I18N = True

USE_L10N = True

USE_TZ = False


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/

STATIC_URL = '/static/'

# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'


###################################
## AWS Setting
###################################
# AWS_REGION = 'ap-northeast-2'
# AWS_STORAGE_BUCKET_NAME = 'workshop-img'
# AWS_S3_CUSTOM_DOMAIN = f'{AWS_STORAGE_BUCKET_NAME}.s3.{AWS_REGION}.amazonaws.com'
# Use an AWS profile for authentication
# session = boto3.Session(profile_name='default')
# s3 = session.resource('s3')
# Set the default storage engine for Django to use S3
# DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'

LOGIN_REDIRECT_URL = '/product/'
LOGIN_URL = '/login/'
LOGOUT_URL = '/login/'


PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
        'OPTIONS': {
            'min_length': 4,
        }
    },
]


AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
        'OPTIONS': {
            'min_length': 4,
        }
    },
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
        'OPTIONS': {
            'user_attributes': ('username', 'email'),
        },
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# LOGGING = {
#     'version': 1,
#     'disable_existing_loggers': False,
#     'handlers': {
#         'access_log': {
#             'class': 'logging.handlers.WatchedFileHandler',
#             'filename': '/var/log/ecommerce/access.log',
#             'formatter': 'nginx_access_log',
#         },
#     },
#     'formatters': {
#         'nginx_access_log': {
#             'format': '$remote_addr - $remote_user [$time_local] "$request" '
#                       '$status $body_bytes_sent "$http_referer" '
#                       '"$http_user_agent" "$http_x_forwarded_for"',
#         },
#     },
#     'loggers': {
#         'django.request': {
#             'handlers': ['access_log'],
#             'level': 'INFO',
#             'propagate': True,
#         },
#     },
# }

AUTH_USER_MODEL = 'order.User'
