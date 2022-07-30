import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const GalleryButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.withOpacity(0.1),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.sansita(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
