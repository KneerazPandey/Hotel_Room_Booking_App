import 'package:flutter/material.dart';
import 'package:frontend/core/controllers/controller.dart';
import 'package:frontend/features/login/services/login_services.dart';
import 'package:frontend/features/signup/screens/sign_up_screen.dart';
import 'package:frontend/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopLoginScreen extends StatefulWidget {
  const DesktopLoginScreen({Key? key}) : super(key: key);

  @override
  State<DesktopLoginScreen> createState() => _DesktopLoginScreenState();
}

class _DesktopLoginScreenState extends State<DesktopLoginScreen> {
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
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/login_background.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            return Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  color: Colors.cyan.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      'Login',
                      style: GoogleFonts.sansita(
                        fontSize: 62,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 150),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText: 'Email',
                            controller: _emailController,
                            icon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (String value) {
                              loginController.setEmailController(value);
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomTextFormField(
                            hintText: 'Password',
                            controller: _passwordController,
                            icon: Icons.lock,
                            obscureText: true,
                            onChanged: (String value) {
                              loginController.setPasswordController(value);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
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
                              },
                            ),
                            Text(
                              'Remember Me',
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        ),
                        Text(
                          'Forget Password?',
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
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
                          color: const Color(0xFF3e3e3e),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
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
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
