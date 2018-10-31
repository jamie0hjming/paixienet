import hashlib
import os
import random
import uuid

from django.http import HttpResponse
from django.shortcuts import render, redirect


# Create your views here.
from myapp.models import User
from paixienet import settings


def mainweb(request):
    token = request.COOKIES.get('token')
    users =User.objects.filter(token = token)
    if users.exists():
        user = users.first()
        img_path = head_path(user.imgRoot)
        return render(request,'mainWeb.html',context={'username':user.name,"img_path":img_path})
    else:
        return render(request,'mainWeb.html')

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

def register(request):
    if request.method == "GET":
        return render(request,'register.html')
    elif request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        passwordverify = request.POST.get('passwordverify')
        if passwordverify == password:
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






def cart(request):
    return render(request,'cart.html')


def goodsinfo(request):


    return render(request,'goodsinfo.html')

# 退出
def logout(request):
    response = redirect('paixienet:mainweb')
    response.delete_cookie('token')
    return response


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


