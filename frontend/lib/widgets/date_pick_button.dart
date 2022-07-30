import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatePickButton extends StatelessWidget {
  final String formatedDate;
  final VoidCallback onPressed;

  const DatePickButton({
    Key? key,
    required this.formatedDate,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 55,
        width: 200,
        decoration: BoxDecoration(
          color: const Color(0xFFee9a6b).withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_month),
            const SizedBox(width: 20),
            Text(
              formatedDate,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: const Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
