import 'package:flutter/material.dart';
import 'package:frontend/core/controllers/controller.dart';
import 'package:frontend/features/about/screen/about_screen.dart';
import 'package:frontend/features/available_room/screen/available_room_screen.dart';
import 'package:frontend/features/blog/screen/blog_screen.dart';
import 'package:frontend/features/contact/screen/contact_screen.dart';
import 'package:frontend/features/gallery/screen/gallery_screen.dart';
import 'package:frontend/features/home/screen/home_screen.dart';
import 'package:frontend/features/login/screens/login_screen.dart';
import 'package:frontend/features/room_book/screen/room_book_screen.dart';
import 'package:frontend/features/service/screen/service_screen.dart';
import 'package:frontend/features/signup/screens/sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const HomeScreen(),
        );
      case AboutScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const AboutScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            loginController.setEmailController('');
            loginController.setPasswordController('');
            return const LoginScreen();
          },
        );
      case SignupScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const SignupScreen(),
        );
      case GalleryScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const GalleryScreen(),
        );
      case BlogScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const BlogScreen(),
        );
      case ContactScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ContactScreen(),
        );
      case ServiceScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ServiceScreen(),
        );
      case AvailableRoomScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const AvailableRoomScreen(),
        );
      case RoomBookScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const RoomBookScreen(),
        );
      case 'Logout':
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            loginController.setEmailController('');
            loginController.setPasswordController('');
            return const LoginScreen();
          },
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(title: const Text('Page Not Found')),
            body: Center(
              child: Text(
                'Page Not Found',
                style: GoogleFonts.sansita(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
          ),
        );
    }
  }
}
