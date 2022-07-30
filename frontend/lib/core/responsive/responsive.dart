import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget? tablet;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
    this.tablet,
  }) : super(key: key);

  static bool isDesktop(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= 1280;
  }

  static bool isTablet(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= 680 && screenWidth < 1280;
  }

  static bool isMobile(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= 300 && screenWidth < 680;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        if (width >= 1280) {
          return desktop;
        } else if (width >= 680 && width < 1280) {
          return tablet ?? desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
