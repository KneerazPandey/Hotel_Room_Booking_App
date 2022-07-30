import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/errors/http_error_handling.dart';
import 'package:frontend/models/room.dart';
import 'package:http/http.dart';

class HotelRoomServices {
  Future<List<Room>> getAllHotelRooms({
    required BuildContext context,
  }) async {
    Uri uri = Uri.parse(GlobalUrl.roomUrl);
    Response response = await get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    List<Room> rooms = [];
    HttpErrorHandling.handleHttpError(
      response: response,
      context: context,
      onSuccess: () {
        Map map = json.decode(response.body) as Map;
        List<dynamic> roomsList = map['rooms'] as List;

        for (var element in roomsList) {
          rooms.add(Room.fromMap(element));
        }
      },
    );
    return rooms;
  }
}
