import 'package:flutter/material.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/errors/http_error_handling.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:http/http.dart';

class HomeService {
  Future<void> makeRoomAbailable({
    required BuildContext context,
  }) async {
    try {
      Uri uri = Uri.parse(GlobalUrl.makeRoomAvailableAfterCheckOutUrl);
      Response response = await get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      HttpErrorHandling.handleHttpError(
        response: response,
        context: context,
        onSuccess: () {},
      );
    } catch (error) {
      CustomSnackBar.showSnackBar(context: context, text: error.toString());
    }
  }
}
