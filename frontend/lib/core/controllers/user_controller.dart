import 'package:frontend/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rx<User> _user = const User(
    id: 0,
    name: '',
    email: '',
    phoneNumber: '',
    password: '',
  ).obs;

  User get user => _user.value;

  void setUser(User newUser) {
    _user.value = newUser;
  }
}
