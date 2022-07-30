import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/errors/http_error_handling.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:http/http.dart';

class ContactServices {
  Future<void> sendMessage({
    required BuildContext context,
    required String fullName,
    required String email,
    required String message,
  }) async {
    try {
      Uri uri = Uri.parse(GlobalUrl.contactMessageUrl);

      Response response = await post(
        uri,
        body: json.encode({
          'name': fullName,
          'email': email,
          'message': message,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      HttpErrorHandling.handleHttpError(
        response: response,
        context: context,
        onSuccess: () {
          CustomSnackBar.showSnackBar(
            context: context,
            text: 'Message send sucessfully',
            isError: false,
          );
        },
      );
    } catch (error) {
      CustomSnackBar.showSnackBar(context: context, text: error.toString());
    }
  }
}
