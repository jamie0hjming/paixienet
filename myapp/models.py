from django.db import models

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=80)
    password = models.CharField(max_length=256)
    imgRoot = models.CharField(max_length=256,default='1.jpg')
    token = models.CharField(max_length=256, default='')


class Goodsinfo(models.Model):
    id_num = models.CharField(max_length=10)
    img = models.CharField(max_length=100)
    old_price = models.CharField(max_length=10)
    new_price = models.CharField(max_length=10)

class Lun_bo(models.Model):
    img = models.CharField(max_length=100)
    track_id = models.CharField(max_length=20)
