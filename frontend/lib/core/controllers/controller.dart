import 'package:frontend/core/controllers/login_controller.dart';
import 'package:frontend/core/controllers/menu_controller.dart';
import 'package:frontend/core/controllers/room_book_controller.dart';
import 'package:frontend/core/controllers/user_controller.dart';
import 'package:get/get.dart';

MenuController menuController = Get.put(MenuController());
RoomBookController roomBookController = Get.put(RoomBookController());
LoginController loginController = Get.put(LoginController());
UserController userController = Get.put(UserController());
