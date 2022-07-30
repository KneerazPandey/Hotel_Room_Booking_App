import 'package:flutter/cupertino.dart';
import 'package:frontend/core/controllers/controller.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';

class Utils {
  static bool searchRoomFound({
    required BuildContext context,
  }) {
    DateTime currentDate = DateTime.now();
    DateTime checkIn = roomBookController.checkInDate;
    DateTime checkOut = roomBookController.checkOutDate;
    int totalGuest =
        roomBookController.adultCount + roomBookController.childrenCount;
    int room = roomBookController.roomCount;

    if (checkIn.difference(currentDate).inDays < 0) {
      CustomSnackBar.showSnackBar(
        context: context,
        text: 'Please select valid date. Invalid check In Date',
      );
      return false;
    }
    if (checkOut.difference(checkIn).inDays < 0) {
      CustomSnackBar.showSnackBar(
        context: context,
        text: 'Please select valid date. Invalid Check Out Date',
      );
      return false;
    }
    if (totalGuest == 0) {
      CustomSnackBar.showSnackBar(
        context: context,
        text: 'Please select the number of person(adult/child)',
      );
      return false;
    }
    if (totalGuest > room * 3) {
      CustomSnackBar.showSnackBar(
        context: context,
        text:
            'Person to room ratio does not match. 1 room can contain at least 3 person',
      );
      return false;
    }
    return true;
  }
}
