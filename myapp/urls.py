from django.conf.urls import url

from myapp import views

urlpatterns = [
    url(r'^$',views.mainweb,name='mainweb'),
    url(r'^login/$',views.login,name='login'),
    url(r'^register/$',views.register,name='register'),


]