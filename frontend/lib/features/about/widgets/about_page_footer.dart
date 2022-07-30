import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPageFooter extends StatelessWidget {
  const AboutPageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Responsive.isDesktop(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildWhatWeOffer(),
              buildMainMail(),
              buildStayTuned(),
            ],
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildWhatWeOffer(),
                  const SizedBox(height: 20),
                  buildMainMail(),
                  const SizedBox(height: 20),
                  buildStayTuned(),
                ],
              ),
            ],
          ),
      ],
    );
  }

  Column buildStayTuned() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.red,
            ),
            const SizedBox(width: 5),
            Text(
              'Stay Tuned',
              style: GoogleFonts.sansita(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: const [
              Icon(
                Icons.facebook,
                color: Colors.blue,
              ),
              SizedBox(width: 20),
              Icon(
                Icons.email,
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildMainMail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.red,
            ),
            const SizedBox(width: 5),
            Text(
              'Main Mail(Email)',
              style: GoogleFonts.sansita(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'dreamhotel@gmail.com',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildWhatWeOffer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.red,
            ),
            const SizedBox(width: 5),
            Text(
              'What We Offer',
              style: GoogleFonts.sansita(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Provide Quality Room',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 6),
              Text(
                'Good Room Services',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 6),
              Text(
                'Alaways Ready To Serve',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
