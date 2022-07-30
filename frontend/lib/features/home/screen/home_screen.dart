import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/features/home/services/home_service.dart';
import 'package:frontend/features/home/widgets/desktop_home_screen.dart';
import 'package:frontend/features/home/widgets/mobile_home_screen.dart';
import 'package:frontend/features/home/widgets/nav_bar.dart';
import 'package:frontend/widgets/nav_bar_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeService _homeService = HomeService();

  @override
  void initState() {
    makeRoomAvailableAfterCheckOut();
    super.initState();
  }

  void makeRoomAvailableAfterCheckOut() async {
    await _homeService.makeRoomAbailable(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFefefef),
      drawer: !Responsive.isDesktop(context)
          ? NavBarDrawer(scaffoldKey: _scaffoldKey)
          : null,
      appBar: navBar(context: context, scaffoldKey: _scaffoldKey),
      body: const Responsive(
        desktop: DesktopHomeScreen(),
        tablet: MobileHomeScreen(),
        mobile: MobileHomeScreen(),
      ),
    );
  }
}
