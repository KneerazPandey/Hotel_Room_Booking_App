import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/features/contact/services/contact_services.dart';
import 'package:frontend/features/home/screen/home_screen.dart';
import 'package:frontend/widgets/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final ContactServices _contactServices = ContactServices();

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isDesktop(context)
          ? MediaQuery.of(context).size.width * 0.4
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width * 0.6
              : MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'Full Name',
                  controller: _fullNameController,
                  icon: Icons.person,
                  onChanged: (String? value) {},
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: _emailController,
                  icon: Icons.email,
                  onChanged: (String? value) {},
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _messageController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: 'Message',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.message),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter messgae before sending';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _contactServices.sendMessage(
                        context: context,
                        fullName: _fullNameController.text,
                        email: _emailController.text,
                        message: _messageController.text,
                      );
                      await Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeScreen.routeName,
                        (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 55),
                    primary: const Color(0xFFee9a6b),
                  ),
                  child: Text(
                    'Send Message',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
