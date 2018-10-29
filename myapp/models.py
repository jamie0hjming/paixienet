from django.db import models

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=80)
    passwd = models.CharField(max_length=256)
    tel = models.CharField(max_length=20)