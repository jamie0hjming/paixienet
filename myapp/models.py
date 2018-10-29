from django.db import models

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=80)
    password = models.CharField(max_length=256)
    token = models.CharField(max_length=256, default='')
