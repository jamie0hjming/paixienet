import hashlib
import io
import os
import random
import uuid

from django.http import HttpResponse
from django.shortcuts import render, redirect


# Create your views here.
from myapp.models import User, Lun_bo, Sport_f1_shoes
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
        img_path = head_path(user.imgRoot)

        data = {
            'username': user.name,
            "img_path": img_path,
            'lun_bo_imgs': lun_bo_imgs,
            'sport_f1_shoes1':sport_f1_shoes1,
            'sport_f1_shoes2': sport_f1_shoes2,
            'sport_f1_shoes3': sport_f1_shoes3,
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
        username = request.POST.get('username')
        password = generate_password(request.POST.get('password'))
        users = User.objects.filter( name=username , password=password )
        if users.exists():
            user = users.first()
            user.token = uuid.uuid3(uuid.uuid4(),'username')
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
        username = request.POST.get('username')
        password = request.POST.get('password')
        passwordverify = request.POST.get('passwordverify')
        verifycode = request.POST.get('verifycode')
        verifycode = verifycode.upper()

        print(print("verifycode:{}".format(verifycode)))
        print(print("rand_str:{}".format(rand_str)))
        print(verifycode== rand_str)
        if verifycode== rand_str:
           print("QQQQQQQQ")

        if (passwordverify == password) and password and username and (verifycode== rand_str):
            try:
                user = User()
                user.name = username
                user.password = generate_password(password)
                user.token = uuid.uuid3(uuid.uuid4(),'username')
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
    return render(request,'cart.html')

# 物品详情
def goodsinfo(request,goods_id):

    sport_f1_shoes = Sport_f1_shoes.objects.get(id=goods_id)
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
    print("AAAAAAAAAAAAA")
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


def test(request):
    lun_bo_imgs = Lun_bo.objects.all()

    return render(request,'test.html',context={'luo_bo_imgs':lun_bo_imgs})