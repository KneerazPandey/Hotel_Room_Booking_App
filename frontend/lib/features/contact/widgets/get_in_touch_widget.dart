import 'package:flutter/material.dart';
import 'package:frontend/features/contact/widgets/contact_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class GetInTouchWidget extends StatelessWidget {
  const GetInTouchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Let's get in touch",
          style: GoogleFonts.halant(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "We're open for any suggestion or just leave a message.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 60),
        const ContactListTile(
          icon: Icons.email_outlined,
          firstContact: 'dreamhotl@gmail.com',
          secondContact: 'dreamhotel@info.con',
        ),
        const SizedBox(height: 60),
        const ContactListTile(
          icon: Icons.place_outlined,
          firstContact: 'Itahari, Piplechowk',
          secondContact: 'Sunsari, Nepal',
        ),
        const SizedBox(height: 60),
        const ContactListTile(
          icon: Icons.phone_outlined,
          firstContact: '9845321458',
          secondContact: '025684123',
        ),
      ],
    );
  }
}
