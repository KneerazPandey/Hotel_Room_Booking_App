import 'package:flutter/cupertino.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/errors/http_error_handling.dart';
import 'package:frontend/features/login/screens/login_screen.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:http/http.dart';

class SignUpServices {
  Future<void> signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      Uri uri = Uri.parse(GlobalUrl.signupUrl);
      User user = User(
        id: 0,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
      Response response = await post(
        uri,
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      HttpErrorHandling.handleHttpError(
        response: response,
        context: context,
        onSuccess: () async {
          CustomSnackBar.showSnackBar(
            context: context,
            text:
                'Registration Sucessfull. Please login with the same credentials',
            isError: false,
          );
          await Navigator.pushNamedAndRemoveUntil(
            context,
            LoginScreen.routeName,
            (route) => false,
          );
        },
      );
      print('At  last');
    } catch (error) {
      CustomSnackBar.showSnackBar(
        context: context,
        text: error.toString(),
      );
    }
  }
}
