import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/features/login/widgets/desktop_login_screen.dart';
import 'package:frontend/features/login/widgets/mobile_login_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'Login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: const Responsive(
          mobile: MobileLoginScreen(),
          tablet: MobileLoginScreen(),
          desktop: DesktopLoginScreen(),
        ),
      ),
    );
  }
}
