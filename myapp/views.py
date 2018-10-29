import hashlib
import uuid

from django.http import HttpResponse
from django.shortcuts import render, redirect


# Create your views here.
from myapp.models import User


def mainweb(request):
    token = request.COOKIES.get('token')
    users =User.objects.filter(token = token)
    if users.exists():
        user = users.first()
        return render(request,'mainWeb.html',context={'username':user.name})
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
        # print(username,password)

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


def cart(request):
    return render(request,'cart.html')


def goodsinfo(request):
    return render(request,'goodsinfo.html')

# 退出
def logout(request):
    response = redirect('paixienet:mainweb')
    response.delete_cookie('token')
    return response