from rest_framework import serializers
from . models import Gallery, Blog, Room, UserContactMessage, Booking


class GallerySerializer(serializers.ModelSerializer):
    class Meta:
        model = Gallery 
        fields = '__all__'


class BlogSerializer(serializers.ModelSerializer):
    class Meta:
        model = Blog
        fields = '__all__'


class RoomSerializer(serializers.ModelSerializer):
    class Meta:
        model = Room 
        fields = '__all__'


class UserContactMessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserContactMessage
        fields = '__all__'


class RoomBookingSerializer(serializers.ModelSerializer):
    check_in_date = serializers.DateField()
    check_out_date = serializers.DateField()

    class Meta:
        model = Booking
        fields = ['user', 'room', 'check_in_date', 'check_out_date', 'adult_count', 'child_count','room_count']

    def create(self, validated_data):
        room = Room.objects.get(id=validated_data.get('room').id)
        room.availability = False
        room.save()
        return super().create(validated_data)


class MakeRoomAvailableSerializer(serializers.ModelSerializer):
    check_in_date = serializers.DateField()
    check_out_date = serializers.DateField()
    room = RoomSerializer()

    class Meta:
        model = Booking
        fields = ['user', 'room', 'check_in_date', 'check_out_date', 'adult_count', 'child_count','room_count']
    


