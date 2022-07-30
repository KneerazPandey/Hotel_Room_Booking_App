from django.urls import path
from . import views


urlpatterns = [
    path('gallery/', views.GalleryAPIView.as_view()),
    path('blog/', views.BlogAPIView.as_view()),
    path('room/', views.RoomAPIView.as_view()),
    path('contact-message/', views.UserContactMessageAPIView.as_view()),
    path('room-book/', views.RoomBookingAPIView.as_view()),
    path('room-check-out/', views.MakeRoomAvailableAfterCheckOutAPIView.as_view()),
]