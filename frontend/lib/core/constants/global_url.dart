import 'package:flutter/foundation.dart';

class GlobalUrl {
  static const String loginUrl = kIsWeb
      ? 'http://127.0.0.1:8000/api/auth/login/'
      : 'http://10.0.2.2:8000/api/auth/login/';

  static const String signupUrl = kIsWeb
      ? 'http://127.0.0.1:8000/api/auth/signup/'
      : 'http://10.0.2.2:8000/api/auth/signup/';

  static const String galleryUrl = kIsWeb
      ? 'http://127.0.0.1:8000/api/rooms/gallery/'
      : 'http://10.0.2.2:8000/api/rooms/gallery/';

  static const String blogUrl = kIsWeb
      ? 'http://127.0.0.1:8000/api/rooms/blog/'
      : 'http://10.0.2.2:8000/api/rooms/blog/';

  static const String roomUrl = kIsWeb
      ? 'http://127.0.0.1:8000/api/rooms/room/'
      : 'http://10.0.2.2:8000/api/rooms/room/';

  static const String contactMessageUrl = kIsWeb
      ? 'http://127.0.0.1:8000/api/rooms/contact-message/'
      : 'http://10.0.2.2:8000/api/rooms/contact-message/';

  static const String bookRoomUrl = kIsWeb
      ? 'http://127.0.0.1:8000/api/rooms/room-book/'
      : 'http://10.0.2.2:8000/api/rooms/room-book/';

  static const String makeRoomAvailableAfterCheckOutUrl = kIsWeb
      ? 'http://127.0.0.1:8000/api/rooms/room-check-out/'
      : 'http://10.0.2.2:8000/api/rooms/room-check-out/';

  static const String accessImageUrl =
      kIsWeb ? 'http://127.0.0.1:8000' : 'http://10.0.2.2:8000';
}
