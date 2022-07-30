import 'package:flutter/material.dart';
import 'package:frontend/features/signup/widgets/responsive_signup_screen.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = 'Register';

  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: const ResponsiveSignupScreen(),
      ),
    );
  }
}
