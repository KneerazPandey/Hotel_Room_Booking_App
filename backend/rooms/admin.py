from django.contrib import admin
from . models import Gallery, Blog, Room, UserContactMessage, Booking


admin.site.register(Gallery)
admin.site.register(Blog)
admin.site.register(Room)
admin.site.register(UserContactMessage)
admin.site.register(Booking)