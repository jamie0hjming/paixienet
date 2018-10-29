from django.shortcuts import render, redirect


# Create your views here.
def mainweb(request):
    return render(request,'mainWeb.html')


def login(request):
    if request.method == 'GET':
        return render(request,'login.html')
    elif request.method == 'POST':
        return render(request,'mainWeb.html')


# def register(request):
#     print("BBBBBBBB")
#     print('register',request.method)
#     username = request.COOKIES.get("name")
#     password = request.COOKIES.get('password')
#     print('B注册{}{}'.format(username,password))
#     return render(request,'register.html')
    # if request.method == 'GET':
    #     print("CCCCCC")
    #     return render(request,'register.html')
    # elif request.method == 'POST':
    #     print('AAAAAAAAAAA12313')
    #     username = request.POST.get('name')
    #     password = request.POST.get('password')
    #     print(username,password)
    #     print('AAAAAAAAAAA')
    #     return render(request,'mainWeb.html')
    #
def register(request):
    # if a :
    #
    #     print('user_cookie', request.method)
    #     print("NNNNNNNNNNNN")
    #     username = request.COOKIES.get("name")
    #     password = request.COOKIES.get('password')
    #     print(username,password)
    #     return render(request,'mainWeb.html')
    # else:
        return render(request,'register.html')
