import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/controllers/controller.dart';
import 'package:frontend/core/errors/http_error_handling.dart';
import 'package:frontend/features/home/screen/home_screen.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:http/http.dart';

class LoginService {
  Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      Uri uri = Uri.parse(GlobalUrl.loginUrl);
      Response response = await post(
        uri,
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      HttpErrorHandling.handleHttpError(
        response: response,
        context: context,
        onSuccess: () async {
          userController.setUser(User.fromJson(response.body));
          CustomSnackBar.showSnackBar(
            context: context,
            text: 'Login Sucessfully',
            isError: false,
          );
          await Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (error) {
      CustomSnackBar.showSnackBar(
        context: context,
        text: error.toString(),
      );
    }
  }
}
