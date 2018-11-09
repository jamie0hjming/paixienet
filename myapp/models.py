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
    is_select = models.BooleanField(default=True) # 默认商品是被选中的

    class Meta:
        db_table='cart'

class Order(models.Model):
    user = models.ForeignKey(User)
    # 创建时间
    createtime = models.DateTimeField(auto_now_add=True)
    # 状态
    # -1 过期
    # 1 未付款
    # 2 已付款，未发货
    # 3 已发货，快递
    # 4 已签收，未评价
    # 5 已评价
    # 6 退款....
    status = models.IntegerField(default=1)
    # 订单号
    identifier = models.CharField(max_length=256)


# 订单商品
# 一个订单 对应 多个商品
# 在从表中声明关系
class OrderGoods(models.Model): # 关联订单和商品(其中订单还关联用户）
    # 订单
    order = models.ForeignKey(Order)
    # 商品
    sport_f1_shoes = models.ForeignKey(Sport_f1_shoes)
    # 个数
    number = models.IntegerField(default=1)

    # 大小
    # 颜色


