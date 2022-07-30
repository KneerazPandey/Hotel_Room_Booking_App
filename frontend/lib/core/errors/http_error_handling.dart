import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:http/http.dart';

class HttpErrorHandling {
  static void handleHttpError({
    required Response response,
    required BuildContext context,
    required VoidCallback onSuccess,
  }) {
    switch (response.statusCode) {
      case 200:
        onSuccess();
        break;
      case 201:
        onSuccess();
        break;
      case 400:
        if (json.decode(response.body)['error'] != null) {
          String error = json.decode(response.body)['error'];
          CustomSnackBar.showSnackBar(context: context, text: error);
        } else if (json.decode(response.body)['email'] != null) {
          String error = json.decode(response.body)['email'][0];
          CustomSnackBar.showSnackBar(context: context, text: error);
        } else if (json.decode(response.body)['password'] != null) {
          String error = json.decode(response.body)['password'][0];
          CustomSnackBar.showSnackBar(context: context, text: error);
        }

        break;
      default:
        CustomSnackBar.showSnackBar(
          context: context,
          text: json.decode(response.body),
        );
        break;
    }
  }
}
