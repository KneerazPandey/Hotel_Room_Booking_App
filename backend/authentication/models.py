from django.db import models
from django.contrib.auth.models import AbstractUser
from . managers import CustomUserManager



class User(AbstractUser):
    username = None
    name = models.CharField(max_length=100)
    email = models.EmailField(max_length=255, unique=True)
    phone_number = models.PositiveBigIntegerField()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name', 'phone_number']

    objects = CustomUserManager()

    def __str__(self):
        return self.email
