import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactListTile extends StatelessWidget {
  final IconData icon;
  final String firstContact;
  final String secondContact;

  const ContactListTile({
    Key? key,
    required this.icon,
    required this.firstContact,
    required this.secondContact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: Responsive.isDesktop(context)
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(width: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstContact,
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(height: 8),
            Text(
              secondContact,
              style: GoogleFonts.poppins(),
            ),
          ],
        ),
      ],
    );
  }
}
