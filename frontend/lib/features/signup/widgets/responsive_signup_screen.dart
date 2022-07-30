import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/features/login/screens/login_screen.dart';
import 'package:frontend/features/signup/services/sign_up_services.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';
import 'package:frontend/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveSignupScreen extends StatefulWidget {
  const ResponsiveSignupScreen({Key? key}) : super(key: key);

  @override
  State<ResponsiveSignupScreen> createState() => _ResponsiveSignupScreenState();
}

class _ResponsiveSignupScreenState extends State<ResponsiveSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final SignUpServices _signUpServices = SignUpServices();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _password1Controller.dispose();
    _password2Controller.dispose();
    super.dispose();
  }

  void signUp() async {
    await _signUpServices.signUpUser(
      context: context,
      name: _nameController.text,
      email: _emailController.text,
      phoneNumber: _phoneNumberController.text,
      password: _password1Controller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.only(
        right: Responsive.isDesktop(context)
            ? width * 0.4
            : Responsive.isTablet(context)
                ? width * 0.3
                : width * 0.1,
        top: Responsive.isDesktop(context)
            ? width * 0.05
            : Responsive.isTablet(context)
                ? width * 0.1
                : width * 0.1,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/signup_background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Responsive.isDesktop(context)
                ? const Radius.circular(100)
                : Responsive.isTablet(context)
                    ? const Radius.circular(80)
                    : const Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(3, 0),
              blurRadius: 2,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isDesktop(context)
                  ? 140
                  : Responsive.isTablet(context)
                      ? 90
                      : 30,
            ),
            child: Column(
              children: [
                if (kIsWeb) SizedBox(height: height * 0.09),
                SizedBox(height: height * 0.01),
                Text(
                  "Sign Up",
                  style: GoogleFonts.sansita(
                    fontSize: 60,
                  ),
                ),
                SizedBox(height: height * 0.05),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _nameController,
                        hintText: 'Username',
                        icon: Icons.person,
                        onChanged: (String value) {},
                      ),
                      SizedBox(height: height * 0.03),
                      CustomTextFormField(
                        controller: _emailController,
                        hintText: 'Email',
                        icon: Icons.email,
                        onChanged: (String value) {},
                      ),
                      SizedBox(height: height * 0.03),
                      CustomTextFormField(
                        controller: _phoneNumberController,
                        hintText: 'Phone Number',
                        icon: Icons.phone,
                        onChanged: (String value) {},
                      ),
                      SizedBox(height: height * 0.03),
                      CustomTextFormField(
                        controller: _password1Controller,
                        hintText: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        onChanged: (String value) {},
                      ),
                      SizedBox(height: height * 0.03),
                      CustomTextFormField(
                        controller: _password2Controller,
                        hintText: 'Confirm Password',
                        icon: Icons.lock,
                        obscureText: true,
                        onChanged: (String value) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextButton(
                  onPressed: () async {
                    await Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreen.routeName,
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Already Have An Account?',
                    style: GoogleFonts.poppins(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_password1Controller.text ==
                          _password2Controller.text) {
                        signUp();
                      } else {
                        CustomSnackBar.showSnackBar(
                          context: context,
                          text: 'Password and Confirm Password does not match',
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 55),
                    primary: Colors.orange,
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.034),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
