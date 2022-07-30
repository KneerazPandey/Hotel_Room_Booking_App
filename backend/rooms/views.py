from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework import status, generics
from . serializers import (
    GallerySerializer, BlogSerializer, RoomSerializer, 
    UserContactMessageSerializer, RoomBookingSerializer,
    MakeRoomAvailableSerializer
)
from . models import Gallery, Blog, Room, UserContactMessage, Booking
import datetime


class GalleryAPIView(generics.GenericAPIView):
    serializer_class = GallerySerializer
    queryset = Gallery.objects.all()

    def get(self, request: Request):
        photos = self.get_queryset()
        serializer = self.serializer_class(photos, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def get_queryset(self):
        q = self.request.query_params.get('query', '')
        if q == '':
            photos = Gallery.objects.all()
        else:
            photos = Gallery.objects.filter(category__icontains=q)
            
        return photos


class BlogAPIView(generics.GenericAPIView):
    serializer_class = BlogSerializer
    queryset = Blog.objects.all()

    def get(self, request: Request):
        blogs = self.get_queryset()
        serializer = self.serializer_class(blogs, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


class RoomAPIView(generics.GenericAPIView):
    serializer_class = RoomSerializer
    queryset = Room.objects.all()

    def get(self, request: Request):
        rooms = self.get_queryset()
        available_rooms = Room.objects.filter(availability=True)

        all_room_serializer = self.serializer_class(rooms, many=True)
        available_room_serializer = self.serializer_class(available_rooms, many=True)

        data = {
            'rooms': all_room_serializer.data,
            'available_rooms': available_room_serializer.data
        }

        return Response(data, status=status.HTTP_200_OK)


class UserContactMessageAPIView(generics.GenericAPIView):
    serializer_class = UserContactMessageSerializer
    queryset = UserContactMessage.objects.all()

    def post(self, request: Request):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class RoomBookingAPIView(generics.GenericAPIView):
    serializer_class = RoomBookingSerializer
    queryset = Booking.objects.all()

    def post(self, request: Request):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response({'error': 'There is error while booking a room. Please try again'}, status=status.HTTP_400_BAD_REQUEST)


class MakeRoomAvailableAfterCheckOutAPIView(generics.GenericAPIView):
    serializer_class = MakeRoomAvailableSerializer
    queryset = Booking.objects.all()

    def get(self, request: Request):
        booking = self.get_queryset()
        current_date = datetime.date.today()
        for book in booking:
            if book.check_out_date < current_date:
                update_room = Room.objects.get(id=book.room.id)
                update_room.availability = True
                update_room.save()
        serializer = self.serializer_class(booking, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

