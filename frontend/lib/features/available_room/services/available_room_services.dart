import 'package:flutter/cupertino.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/errors/http_error_handling.dart';
import 'package:http/http.dart';

class AvailableRoomServices {
  Future<Response> getHotelRooms({
    required BuildContext context,
  }) async {
    Uri uri = Uri.parse(GlobalUrl.roomUrl);
    Response response = await get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    HttpErrorHandling.handleHttpError(
      response: response,
      context: context,
      onSuccess: () {},
    );
    return response;
  }
}
