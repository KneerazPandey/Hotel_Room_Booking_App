from django.urls import path
from . import views


urlpatterns = [
    path('signup/', views.UserRegistrationAPIView.as_view(), name='signup'),
    path('login/', views.UserLoginAPIView.as_view(), name='login'),
]