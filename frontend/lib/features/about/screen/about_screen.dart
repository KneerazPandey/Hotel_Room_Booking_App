import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/features/about/widgets/about_page_footer.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = 'About';

  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage("assets/signup_background.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Responsive.isDesktop(context)
                              ? 'Welcome to Dream Hotel.\nLive you Life.'
                              : 'Welcome to\nDream Hotel\nLive you Life.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sansita(
                            height: 1.5,
                            color: Colors.white,
                            fontSize: Responsive.isDesktop(context)
                                ? 62
                                : Responsive.isTablet(context)
                                    ? 52
                                    : 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 150),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Wrap(
                        children: [
                          Text(
                            "Lorem Ipsum is simply dummy hello there how is the text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.red,
                      width: 3,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: Text(
                  '5 Years Of Experience',
                  style: GoogleFonts.headlandOne(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const AboutPageFooter(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
