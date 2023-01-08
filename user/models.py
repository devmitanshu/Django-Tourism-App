from unicodedata import name
from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    auth_token =models.CharField(max_length=100)
    is_verified = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    name = models.CharField(max_length=250)
    number = models.IntegerField(max_length=12)
    gender = models.CharField(max_length=30)
    country = models.CharField(max_length=80)
    image = models.ImageField(upload_to = "Tours/images",default="")

    def __str__(self):
        return self.user.username