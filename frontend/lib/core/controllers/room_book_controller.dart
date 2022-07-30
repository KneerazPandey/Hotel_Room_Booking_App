import 'package:get/get.dart';

class RoomBookController extends GetxController {
  final RxInt _childrenCount = 0.obs;
  final RxInt _adultCount = 1.obs;
  final RxInt _roomCount = 1.obs;
  final _checkInDate = DateTime.now().obs;
  final _checkOutDate = DateTime.now().obs;

  int get childrenCount => _childrenCount.value;

  int get adultCount => _adultCount.value;

  int get roomCount => _roomCount.value;

  DateTime get checkInDate => _checkInDate.value;

  DateTime get checkOutDate => _checkOutDate.value;

  void setChildrenCount(int newChildrenCount) {
    _childrenCount.value = newChildrenCount;
  }

  void setAdultCount(int newAdultCount) {
    _adultCount.value = newAdultCount;
  }

  void setRoomCount(int newRoomCount) {
    _roomCount.value = newRoomCount;
  }

  void setCheckInDate(DateTime selectedCheckInDate) {
    _checkInDate.value = selectedCheckInDate;
  }

  void setCheckOutDate(DateTime selectedCheckedOutDate) {
    _checkOutDate.value = selectedCheckedOutDate;
  }
}
