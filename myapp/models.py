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

class Sport_f1_shoes(models.Model):
    img = models.CharField(max_length=100)
    sc = models.CharField(max_length=255)
    price = models.IntegerField()
    img1 = models.CharField(max_length=100)
    img2 = models.CharField(max_length=100)
    img3 = models.CharField(max_length=100)
    img4 = models.CharField(max_length=100)
    img5 = models.CharField(max_length=100)

    s1 = models.CharField(max_length=100)
    s2 = models.CharField(max_length=100)
    s3 = models.CharField(max_length=100)
    s4 = models.CharField(max_length=100)
    s5 = models.CharField(max_length=100)
    c1 = models.CharField(max_length=100)

    size = models.CharField(max_length=6)
    num = models.IntegerField()
    id_num = models.IntegerField()

class Cart(models.Model):
    user = models.ForeignKey(User)
    shoes = models.ForeignKey(Sport_f1_shoes)
    num = models.IntegerField()
    is_select = models.BooleanField(default=True)

    class Meta:
        db_table='cart'

