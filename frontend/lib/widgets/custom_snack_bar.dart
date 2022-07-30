import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackBar {
  static void showSnackBar({
    required BuildContext context,
    bool isError = true,
    required String text,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 300),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
