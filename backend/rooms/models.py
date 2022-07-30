from django.db import models
from authentication.models import User


class Room(models.Model):
    name = models.CharField(max_length=255)
    guest_count = models.IntegerField(default=2)
    price = models.DecimalField(decimal_places=2, max_digits=15)
    room_size = models.DecimalField(decimal_places=2, max_digits=15)
    availability = models.BooleanField(default=True)
    image = models.ImageField(upload_to='rooms')

    def __str__(self):
        return self.name


class Booking(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    check_in_date = models.DateField()
    check_out_date = models.DateField()
    adult_count = models.IntegerField()
    child_count = models.IntegerField()
    room_count = models.IntegerField()

    def __str__(self):
        return f'{self.room} booked by {self.user}'


class Blog(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    image = models.ImageField(upload_to='blog')
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title


class UserContactMessage(models.Model):
    name = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    message = models.TextField()

    def __str__(self):
        return self.name


class Gallery(models.Model):
    category_option = (
        ('Spa', 'Spa'),
        ('Restaurant', 'Restaurant'),
        ('Room', 'Room'),
        ('Activity', 'Activity'),
        ('Pool', 'Pool'),
    )
    category = models.CharField(choices=category_option, max_length=200)
    image = models.ImageField(upload_to='gallery')

    def __str__(self):
        return f'{self.image} --- {self.category}'

