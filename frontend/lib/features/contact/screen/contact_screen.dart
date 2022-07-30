import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/features/contact/widgets/contact_form_widget.dart';
import 'package:frontend/features/contact/widgets/contact_screen_header.dart';
import 'package:frontend/features/contact/widgets/get_in_touch_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatelessWidget {
  static const String routeName = 'Contact';

  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: const Color(0xFFefefef),
        title: Text(
          'Contact  Page',
          style: GoogleFonts.sansita(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          decoration: const BoxDecoration(
            color: Color(0xFFf1f2f7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ContactScreenHeader(),
              const SizedBox(height: 50),
              if (Responsive.isDesktop(context))
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.isDesktop(context) ? 60 : 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      GetInTouchWidget(),
                      ContactFormWidget(),
                    ],
                  ),
                )
              else
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.isDesktop(context) ? 60 : 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      GetInTouchWidget(),
                      SizedBox(height: 50),
                      ContactFormWidget(),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
