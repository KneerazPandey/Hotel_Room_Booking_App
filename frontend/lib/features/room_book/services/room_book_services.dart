import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/errors/http_error_handling.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:http/http.dart';

class RoomBookServices {
  Future<bool> bookRoom({
    required BuildContext context,
    required int userId,
    required int roomId,
    required String checkInDate,
    required String checkOutDate,
    required int childCount,
    required int adultCount,
    required int roomCount,
  }) async {
    try {
      Uri uri = Uri.parse(GlobalUrl.bookRoomUrl);

      Response response = await post(
        uri,
        body: json.encode({
          'user': userId,
          'room': roomId,
          'check_in_date': checkInDate,
          'check_out_date': checkOutDate,
          'adult_count': adultCount,
          'child_count': childCount,
          'room_count': roomCount,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      HttpErrorHandling.handleHttpError(
        response: response,
        context: context,
        onSuccess: () {
          CustomSnackBar.showSnackBar(
            context: context,
            text: 'Room Booked Sucessfuly',
            isError: false,
          );
        },
      );
      return true;
    } catch (error) {
      CustomSnackBar.showSnackBar(context: context, text: error.toString());
      return false;
    }
  }
}
