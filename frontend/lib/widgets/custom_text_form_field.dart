import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final IconData icon;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final Color fillColor;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    required this.icon,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
    this.fillColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: fillColor,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      obscureText: obscureText,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
