import io
from django import template
from django.conf import settings
from django.core.files.base import ContentFile
from PIL import Image
import boto3
import botocore
import os


register = template.Library()

s3 = boto3.client('s3')

@register.filter(name='resize')
def resize(image_url, size):
    bucket_name = settings.AWS_STORAGE_BUCKET_NAME
    url = 'https://' + settings.AWS_S3_CUSTOM_DOMAIN + '/'

    resize_folder = f'resize_{size}'
    
    source_key = image_url.replace(url, '')
    # file_name, ext = source_key.split('.')    
    *path_parts, filename = source_key.split('/')
    file_name, ext = filename.split('.')    
    # dest_key = os.path.join('resize', f'{file_name}_{size}.{ext}') # resize 폴더에 저장할 경로를 생성합니다.
    dest_key = '/'.join(path_parts) + '/'+resize_folder+'/' + f'{file_name}_{size}.{ext}'
    width, height = [int(x) for x in size.split('x')]

    # Check if the resized image already exists
    resized_url = url + dest_key
    try:
        s3.head_object(Bucket=bucket_name, Key=dest_key)
        return resized_url
    except botocore.exceptions.ClientError as e:
        if e.response['Error']['Code'] != '404':
            raise e

    # Download the original image from S3
    response = s3.get_object(Bucket=bucket_name, Key=source_key)
    image_bytes = response['Body'].read()
    img = Image.open(io.BytesIO(image_bytes))

    # Resize the image
    img_resized = img.resize((width, height))

    # Save the resized image to bytes
    img_bytes = io.BytesIO()
    img_resized.save(img_bytes, format=img.format)
    img_bytes.seek(0)

    # Upload the resized image to S3
    s3.put_object(Bucket=bucket_name, Key=dest_key, Body=img_bytes)

    # Return the URL of the resized image
    return resized_url
