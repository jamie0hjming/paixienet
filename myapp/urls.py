from django.conf.urls import url

from myapp import views

urlpatterns = [
    url(r'^$',views.mainweb,name='mainweb'),
    url(r'^login/$',views.login,name='login'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^register/$',views.register,name='register'),
    url(r'^cart/$',views.cart,name='cart'),
    url(r'^uploadimg/$',views.uploadimg,name='uploadimg'),
    url(r'^goodsinfo/(\d+)/$',views.goodsinfo,name='goodsinfo'),
    url(r'^verifycode/\d+/$',views.verifycode,name='verifycode'),
    url(r'^addcart/$', views.addcart, name='addcart'),
    url(r'^subcart/$', views.subcart, name='subcart'),
    url(r'^order/(\d+)/$', views.order, name='order'),
    url(r'^changecartstatus/$', views.changecartstatus, name='changecartstatus'),  # 修改选中状态
    url(r'^changecartselect/$', views.changecartselect, name='changecartselect'),  # 全选/取消全选
    url(r'^delallgoods/$', views.delallgoods, name='delallgoods'),  # 清空购物车
    url(r'^delselectgoods/$', views.delselectgoods, name='delselectgoods'),  # 删除选中商品
    url(r'^delbut/(\d+)/$', views.delbut, name='delbut'),  # 删除按钮删除对应商品
    url(r'^dynflashnum/$', views.dynflashnum, name='dynflashnum'),  # 删除按钮删除对应商品
    url(r'^checkaccount/$', views.checkaccount, name='checkaccount'),  # 删除按钮删除对应商品
    url(r'^generateorder/$', views.generateorder, name='generateorder'),  # 下单
    url(r'^notify/$', views.notify, name='notify'),  # 订单支付后，支付宝给客户端的提示url
    url(r'^returnurl/$', views.returnurl, name='returnurl'),  # 订单支付后，支付宝给客户端的提示url
    url(r'^pay/$', views.pay, name='pay'),

]