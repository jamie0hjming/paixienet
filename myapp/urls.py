from django.conf.urls import url

from myapp import views

urlpatterns = [
    url(r'^$',views.mainweb,name='mainweb'),
    url(r'^login/$',views.login,name='login'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^register/$',views.register,name='register'),
    url(r'^cart/$',views.cart,name='cart'),
    url(r'^uploadimg/$',views.uploadimg,name='uploadimg'),
    url(r'^goodsinfo/$',views.goodsinfo,name='goodsinfo'),
    url(r'^verifycode/\d+/$',views.verifycode,name='verifycode'),
]