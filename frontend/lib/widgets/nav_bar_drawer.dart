import 'package:flutter/material.dart';
import 'package:frontend/core/constants/drawer_menus.dart';
import 'package:frontend/core/controllers/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavBarDrawer({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                padding: const EdgeInsets.all(0),
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFFefefef),
                  child: Center(
                    child: Text(
                      'Hotel Name',
                      style: GoogleFonts.sansita(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: List.generate(
                  drawerMenus.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                        onTap: () {
                          final current = drawerMenus[index];
                          scaffoldKey.currentState!.closeDrawer();
                          if (current == 'Home') {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              drawerMenus[index],
                              (route) => false,
                            );
                          } else {
                            Navigator.pushNamed(context, drawerMenus[index]);
                          }
                        },
                        onHover: (bool value) {
                          value
                              ? menuController.setHoverMenu(
                                  menu: drawerMenus[index])
                              : menuController.setHoverMenu(menu: 'None');
                        },
                        child: Container(
                          height: 50,
                          color: menuController.hoverMenu == drawerMenus[index]
                              ? const Color(0xFF333333).withOpacity(0.1)
                              : Colors.transparent,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Icon(
                                drawerMenusIcon[index],
                                color: const Color(0xFF333333),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                drawerMenus[index],
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
