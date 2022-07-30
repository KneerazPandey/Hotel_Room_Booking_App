from django.contrib.auth.base_user import BaseUserManager
from django.utils.translation import gettext_lazy as _


class CustomUserManager(BaseUserManager):
    def create_user(self, name, email, phone_number, password, **extra_fields):
        if not name:
            raise ValueError(_('Name is required field'))
        if not email:
            raise ValueError(_('Email is required field'))
        if not phone_number:
            raise ValueError(_('PhoneNumber is required field'))
        if not password:
            raise ValueError(_('Password is required field'))
        
        email = self.normalize_email(email=email)
        user = self.model(name=name, email=email, phone_number=phone_number, **extra_fields)
        user.set_password(password)
        user.save()
        return user 

    def create_superuser(self, name, email, phone_number, password, **extra_fields):
        extra_fields.setdefault('is_active', True)
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError(_('Superuser must have is_staff=True'))
        if extra_fields.get('is_active') is not True:
            raise ValueError(_('Superuser must have is_active=True'))
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(_('Superuser must have is_superuser=True'))

        return self.create_user(name=name, email=email, phone_number=phone_number, password=password, **extra_fields)