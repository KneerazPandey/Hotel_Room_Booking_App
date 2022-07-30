import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxBool _isSelected = false.obs;
  final RxString _emailController = ''.obs;
  final RxString _passwordController = ''.obs;

  bool get isSelected => _isSelected.value;

  void setIsSelected(bool value) {
    _isSelected.value = value;
  }

  String get emailController => _emailController.value;

  String get passwordController => _passwordController.value;

  void setEmailController(String value) {
    _emailController.value = value;
  }

  void setPasswordController(String value) {
    _passwordController.value = value;
  }
}
