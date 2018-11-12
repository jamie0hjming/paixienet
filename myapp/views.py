import hashlib
import io
import os
import random
import time
import uuid

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect


# Create your views here.
from myapp.models import User, Lun_bo, Sport_f1_shoes, Cart, Order, OrderGoods
from paixienet import settings

# 首页
def mainweb(request):
    token = request.COOKIES.get('token')
    users =User.objects.filter(token = token)

    lun_bo_imgs = Lun_bo.objects.all()
    sport_f1_shoes = Sport_f1_shoes.objects.all()
    sport_f1_shoes1 = sport_f1_shoes[0:10]
    sport_f1_shoes2 = sport_f1_shoes[10:20]
    sport_f1_shoes3 = sport_f1_shoes[20:30]
    for shoes in sport_f1_shoes2:
        print(shoes.img)
    if users.exists():
        user = users.first()
        carts = Cart.objects.filter(user=user)
        carts_num = carts.count()
        img_path = head_path(user.imgRoot)

        data = {
            'username': user.name,
            "img_path": img_path,
            'lun_bo_imgs': lun_bo_imgs,
            'sport_f1_shoes1':sport_f1_shoes1,
            'sport_f1_shoes2': sport_f1_shoes2,
            'sport_f1_shoes3': sport_f1_shoes3,
            'carts_num':carts_num,
        }
        return render(request,'mainWeb.html',context=data)
    else:
        data = {
            'lun_bo_imgs': lun_bo_imgs,
            'sport_f1_shoes1':sport_f1_shoes1,
            'sport_f1_shoes2': sport_f1_shoes2,
            'sport_f1_shoes3': sport_f1_shoes3,
        }
        return render(request,'mainWeb.html',context=data)

# 登陆
def login(request):
    if request.method == 'GET':
        return render(request, 'login.html')
    elif request.method == 'POST':
        account = request.POST.get('account')
        password = generate_password(request.POST.get('password'))
        users = User.objects.filter(account=account, password=password)
        if users.exists():
            user = users.first()
            user.token = uuid.uuid3(uuid.uuid4(),'account')
            user.save()
            response = redirect('paixienet:mainweb')
            response.set_cookie('token',user.token)
            return response
        else:
            return HttpResponse('密码或账户错误')

# 加密密码
def generate_password(password):
    sha = hashlib.sha512()
    sha.update(password.encode('utf-8'))
    return sha.hexdigest()

#注册

def register(request):
    if request.method == "GET":
        return render(request,'register.html')
    elif request.method == "POST":
        account = request.POST.get('account')
        password = request.POST.get('password')
        username = request.POST.get('nickname')
        passwd = request.POST.get('passwd')
        verifycode = request.POST.get('verifycode')

        verifycode = verifycode.upper()

        print(print("verifycode:{}".format(verifycode)))
        print(print("rand_str:{}".format(rand_str)))
        print(verifycode== rand_str)
        if verifycode != rand_str:
           return HttpResponse('验证码错误')

        if (passwd == password) and password and username and (verifycode== rand_str):
            try:

                user = User()
                user.name = username
                user.password = generate_password(password)
                user.token = uuid.uuid3(uuid.uuid4(),'username')
                user.account = account
                user.save()
                response = redirect('paixienet:mainweb')
                response.set_cookie('token',user.token)
                return response
            except Exception as e :
                return HttpResponse('注册失败')
        else:
            return HttpResponse('注册失败')





# 商城
def cart(request):
    token = request.COOKIES.get('token')

    if token:
        user = User.objects.get(token=token)
        carts =Cart.objects.filter(user=user)
        carts_num = carts.count()

        data ={
            'user':user,
            'carts':carts,
            'carts_num':carts_num,
        }
        return render(request, 'cart.html', context=data)
    else:
        return render(request,'login.html')



# 物品详情
def goodsinfo(request,goods_id):

    token = request.COOKIES.get('token')
    users = User.objects.filter(token=token)
    sport_f1_shoes = Sport_f1_shoes.objects.get(id=goods_id)
    if users.exists():
        user = users.first()
        carts = Cart.objects.filter(user=user)
        carts_num = carts.count()
        img_path = head_path(user.imgRoot)
        data = {
            'username': user.name,
            "img_path": img_path,
            'sport_f1_shoes': sport_f1_shoes,
            'goodsinfo':goodsinfo,
            'carts_num':carts_num,


        }

        return render(request, 'goodsinfo.html', context=data)
    else:
        data = {
            'sport_f1_shoes':sport_f1_shoes,
        }

        return render(request,'goodsinfo.html',context=data)


# 退出
def logout(request):

    response = redirect('paixienet:mainweb')
    response.delete_cookie('token')
    return response


# 更新图片
def uploadimg(request):
    if request.method == 'GET':
        return render(request,'uploadimg.html')
    elif request.method == 'POST':
        imgload = request.FILES.get('headimg')

        token = request.COOKIES.get('token')
        users = User.objects.filter(token=token)
        user = users.first()

        # 文件保存路径
        print("aAAAAAAAA")
        print(imgload.name)
        print("BBBBBBB")
        filename = str(random.randrange(1, 100)) + '-' + imgload.name
        user.imgRoot = filename
        user.save()
        filepath = os.path.join(settings.IMG_ROOT, filename)
        # 文件写入
        with open(filepath, 'wb') as fp:
            # 分块操作 返回一个生成器对象，当multiple_chunks()为True时应该使用这个方法来代替read().
            for item in imgload.chunks():
                fp.write(item)

        # 更新用户数据库信息
        # user = User
        # request.session['person_data_page'] = filename

        # 回到操作头像的页面
        response = redirect('paixienet:mainweb')

        return response

# 拼接图片路径
def head_path(img_name):
    file_path = os.path.join('loadhead/',img_name)
    return file_path




from PIL import Image,ImageDraw,ImageFont
def verifycode(request):

    # 创建图片
    width = 150
    height = 50
    r = random.randrange(0,256)
    g = random.randrange(0,256)
    b = random.randrange(0,256)
    image = Image.new('RGB', (width, height), (r,g,b))


    # 随机数
    str = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM'
    global rand_str
    rand_str = ''

    for i in range(0,4):
        temp = random.randrange(0,len(str))
        rand_str += str[temp]


    # 保存随机数，后续为验证
    # session


    # 创建画笔
    draw = ImageDraw.Draw(image)

    # 添加噪点
    for i in range(0,300):
        xy = (random.randrange(0,width), random.randrange(0,height))
        fill = (random.randrange(0,256),random.randrange(0,256),random.randrange(0,256))
        draw.point(xy, fill=fill)

    # 导入字体
    # font = ImageFont.truetype('static/fonts/Laksaman.ttf', 40)
    font = ImageFont.truetype('static/fonts/Laksaman.ttf', 25)

    # 字体颜色
    fontcolor1 = (255, random.randrange(0,256), random.randrange(0,256))
    fontcolor2 = (255, random.randrange(0, 256), random.randrange(0, 256))
    fontcolor3 = (255, random.randrange(0, 256), random.randrange(0, 256))
    fontcolor4 = (255, random.randrange(0, 256), random.randrange(0, 256))


    # 绘制操作
    draw.text((5,3), rand_str[0], fill=fontcolor1,font=font)
    draw.text((25, 3), rand_str[1], fill=fontcolor2, font=font)
    draw.text((45, 3), rand_str[2], fill=fontcolor3, font=font)
    draw.text((65, 3), rand_str[3], fill=fontcolor4, font=font)

    # 释放
    del draw
    rand_str = rand_str.upper()
    print("rand_str:{}".format(rand_str))
    # 文件操作
    buff = io.BytesIO()
    image.save(buff, 'png') # 保存在内存中

    return HttpResponse(buff.getvalue(), 'image/png')


def addcart(request):
    shoes_id = request.GET.get('shoes_id')
    num = int(request.GET.get('num')) # 前端传过来的提交数据
    print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA')
    print(num)
    token = request.COOKIES.get('token')

    resopnse_data = {
        'message': '添加购物车成功',
        'status': 1  # 1标识添加成功，0标识添加失败，-1标识未登录
    }

    if token:
        shoes = Sport_f1_shoes.objects.get(pk=int(shoes_id))
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user).filter(shoes=shoes)
        if carts.exists():  # 修改数量
            cart = carts.first()
            cart.num += num
            cart.save()
            resopnse_data['num'] = cart.num
        else:  # 添加一条新记录
            cart = Cart()
            cart.user = user
            cart.shoes = shoes
            # cart.num = 1
            cart.num = num
            cart.save()
            resopnse_data['num'] = cart.num
        return JsonResponse(resopnse_data)
    else:
        resopnse_data['message'] = '未登录，请登录后操作'
        resopnse_data['status'] = 0
        return JsonResponse(resopnse_data)




def subcart(request):


    # 获取数据
    shoes_id = request.GET.get('shoes_id')
    token = request.COOKIES.get('token')

    # 对应用户 和 商品
    shoes = Sport_f1_shoes.objects.get(pk=int(shoes_id))
    user = User.objects.get(token=token)
    cart = Cart.objects.filter(user=user).get(shoes=shoes)

    print(cart.id)
    responseData = {
        'msg': '购物车减操作成功',
        'status': 1,
        'num': cart.num
    }
    # 删减操作
    print(cart.num)
    if cart.num > 1:
        print(cart.num)
        cart.num = cart.num - 1
        cart.save()
        responseData['num'] = cart.num
        return JsonResponse(responseData)
    else:

        responseData['status'] = 0
        cart.delete()

        return JsonResponse(responseData)


def order(request,identifier):
    token = request.COOKIES.get('token')

    if token:
        order = Order.objects.get(identifier=identifier)
        user = User.objects.get(token=token)
        carts = Cart.objects.filter(user=user)
        carts_num = carts.count()

        data = {
            'order':order,
            'user': user,
            'carts': carts,
            'carts_num': carts_num,
        }
        return render(request, 'order.html', context=data)
    else:
        return render(request, 'login.html')



def changecartstatus(request):  # 修改单选的选中状态 ok
    select_status = request.GET.get('select_status') # 获取购物车中物品被选中状态
    cart_id = request.GET.get('cart_id')  # 获取当前被改变选中状态的对应购物车ID

    cart = Cart.objects.get(pk=int(cart_id))  # 通过购物车ID 获取对应购物车对象，然后对改变其状态
    if select_status == 'true':
        cart.is_select = True
        cart.save()
    else:

        cart.is_select = False
        cart.save()
    return JsonResponse({'status':1})



def changecartselect(request):  # 修改全选的选中状态

    select_status = request.GET.get('select_status') # 获取购物车全选状态

    print(select_status)
    cart = Cart.objects.all()  #  通过购物车ID 获取对应购物车对象，然后对改变其状态
    print(cart.count())
    count = 0

    if select_status == 'true':
        for cart in cart:
            count += 1
            print(count)
            cart.is_select = True
            cart.save()
            print(cart.is_select)
    elif select_status == 'false':
        for cart in cart:
            count += 1
            print(count)
            cart.is_select = False
            cart.save()
            print(cart.is_select)

    return JsonResponse({'status':1})


def delallgoods(request):  # 清空购物车
    carts =Cart.objects.all()
    carts.delete()
    return redirect('paixienet:cart')


def delselectgoods(request):  # 删除选中商品


    carts =Cart.objects.filter(is_select=True)
    if carts:

        carts.delete()

    return redirect('paixienet:cart')


def delbut(request,cart_id):
    cart = Cart.objects.get(pk=int(cart_id))
    cart.delete()

    return redirect('paixienet:cart')


def dynflashnum(request):
    token = request.COOKIES.get('token')
    data = {}
    if token:
        user = User.objects.get(token=token)
        cart = Cart.objects.filter(user=user)
        num = cart.count()
        data['status'] = 1
        data['num'] = num
    return JsonResponse(data)


def checkaccount(request):
    account = request.GET.get('account')
    print(account)
    user = User.objects.filter(account=account)
    print(user.count())
    data = {}
    if user:
        data['status'] = 0
        data['msg'] = '用户名已被注册'
    else:
        data['status'] = 1
        data['msg'] = '用户名可用'
    return JsonResponse(data)


def generateorder(request):
    token = request.COOKIES.get('token')
    user = User.objects.get(token=token)

    # 生成订单
    order = Order()
    order.user = user
    order.identifier = str(int(time.time())) + str(random.randrange(10000, 100000))
    order.save()

    # 订单商品
    carts = Cart.objects.filter(user=user).filter(is_select=True)
    for cart in carts:
        orderGoods = OrderGoods()
        orderGoods.order = order
        orderGoods.sport_f1_shoes = cart.shoes
        orderGoods.number = cart.num
        orderGoods.save()

        # 从购物车移除
        cart.delete()

    responseData = {
        'msg': '订单生成成功',
        'status': 1,
        'identifier': order.identifier
    }

    return JsonResponse(responseData)


