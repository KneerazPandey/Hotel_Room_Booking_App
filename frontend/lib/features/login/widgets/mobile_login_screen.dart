import 'package:flutter/material.dart';
import 'package:frontend/core/controllers/controller.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/features/login/services/login_services.dart';
import 'package:frontend/features/signup/screens/sign_up_screen.dart';
import 'package:frontend/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({Key? key}) : super(key: key);

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginService _loginService = LoginService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _emailController.text = loginController.emailController;
    _passwordController.text = loginController.passwordController;
    super.initState();
  }

  void login() async {
    await _loginService.loginUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/login_background.jpeg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isTablet(context) ? 160 : 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.05),
                    Text(
                      'Login',
                      style: GoogleFonts.sansita(
                        fontSize: 62,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.23),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: _emailController,
                            hintText: 'Email',
                            icon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (String value) {
                              loginController.setEmailController(value);
                            },
                          ),
                          SizedBox(height: height * 0.03),
                          CustomTextFormField(
                            controller: _passwordController,
                            hintText: 'Password',
                            icon: Icons.lock,
                            obscureText: true,
                            onChanged: (String value) {
                              loginController.setPasswordController(value);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: loginController.isSelected,
                              activeColor: Colors.orange,
                              onChanged: (bool? value) {
                                loginController.setIsSelected(
                                    loginController.isSelected ? false : true);
                                _passwordController.text =
                                    loginController.passwordController;
                              },
                            ),
                            Text(
                              'Remember Me',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Forget Password?',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.03),
                    TextButton(
                      onPressed: () async {
                        await Navigator.pushNamedAndRemoveUntil(
                          context,
                          SignupScreen.routeName,
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Don't Have An Account?",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.082),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 55),
                        primary: Colors.orange,
                      ),
                      child: Text(
                        'Log In',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
