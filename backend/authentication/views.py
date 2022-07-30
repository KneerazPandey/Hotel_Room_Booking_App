from rest_framework.response import Response
from rest_framework import generics, status
from django.contrib.auth import authenticate
from . serializers import UserRegistrationSerializer, UserLoginSerializer



class UserRegistrationAPIView(generics.GenericAPIView):
    serializer_class = UserRegistrationSerializer

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            data = {}
            data['message'] = 'User Registration Sucessfully'
            data['data'] = serializer.data
            return Response(data, status=status.HTTP_201_CREATED)
        return Response({'error': serializer.errors}, status=status.HTTP_400_BAD_REQUEST)



class UserLoginAPIView(generics.GenericAPIView):
    serializer_class = UserLoginSerializer

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid():
            email = request.data.get('email')
            password = request.data.get('password')
            user = authenticate(request, email=email, password=password)
            if user is not None:
                data = {}
                data['id'] = user.id
                data['name'] = str(user.name)
                data['email'] = str(user.email)
                data['phone_number'] = str(user.phone_number)
                return Response(data, status=status.HTTP_200_OK)
            return Response({'error': 'Email and Password does not match'}, status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)