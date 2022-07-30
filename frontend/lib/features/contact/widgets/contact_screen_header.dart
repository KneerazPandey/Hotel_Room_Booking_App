import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreenHeader extends StatelessWidget {
  const ContactScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 90),
          Text(
            'CONTACT US',
            style: GoogleFonts.sansita(
              fontSize: Responsive.isDesktop(context) ? 62 : 46,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Our team of Staff care is ready to hear from you.',
            style: GoogleFonts.poppins(),
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }
}
