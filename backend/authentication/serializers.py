from rest_framework import serializers
from rest_framework.validators import ValidationError
from . models import User


class UserRegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        min_length=6, 
        max_length=100, 
        write_only=True, 
        error_messages={
            'min_length': 'Password should be at least six character long', 
            'max_length': 'Password should not be greator than 100 character',
        }
    )

    class Meta:
        model = User 
        fields = ['name', 'phone_number', 'email', 'password']

    def create(self, validated_data):
        return User.objects.create_user(**validated_data)


class UserLoginSerializer(serializers.ModelSerializer):
    email = serializers.CharField(max_length=255)
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User 
        fields = ['email', 'password']


    