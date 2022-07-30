import 'package:get/get.dart';

class MenuController extends GetxController {
  final _hoverMenu = 'None'.obs;

  String get hoverMenu => _hoverMenu.value;

  void setHoverMenu({required String menu}) => _hoverMenu.value = menu;
}
