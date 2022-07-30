import 'package:flutter/material.dart';
import 'package:frontend/core/constants/drawer_menus.dart';
import 'package:frontend/core/controllers/controller.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar navBar({
  required BuildContext context,
  required GlobalKey<ScaffoldState> scaffoldKey,
}) {
  return AppBar(
    backgroundColor: const Color(0xFFefefef),
    elevation: 3,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isMobile(context))
          Text(
            'Hotel Name',
            style: GoogleFonts.sansita(
              color: const Color(0xFF333333),
              letterSpacing: 1,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        if (Responsive.isDesktop(context))
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                drawerMenus.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: InkWell(
                      onTap: () {
                        final current = drawerMenus[index];
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
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onHover: (bool value) {
                        value
                            ? menuController.setHoverMenu(
                                menu: drawerMenus[index])
                            : menuController.setHoverMenu(menu: 'None');
                      },
                      child: Row(
                        children: [
                          Icon(
                            drawerMenusIcon[index],
                            color:
                                menuController.hoverMenu == drawerMenus[index]
                                    ? Colors.lightGreen
                                    : const Color(0xFF333333).withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            drawerMenus[index],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: menuController.hoverMenu ==
                                      drawerMenus[index]
                                  ? Colors.lightGreen
                                  : const Color(0xFF333333).withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          })
      ],
    ),
    leading: !Responsive.isDesktop(context)
        ? IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF333333)),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          )
        : null,
    actions: [
      Center(
        child: Stack(
          children: [
            Icon(
              Icons.notifications,
              color: Colors.black.withOpacity(0.6),
            ),
            Positioned(
              right: 3,
              top: 1,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: 10),
      Center(
        child: Container(
          width: 2,
          height: 30,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      const SizedBox(width: 10),
      Center(
        child: Text(
          userController.user.name,
          style: GoogleFonts.poppins(
            color: const Color(0xFF333333).withOpacity(0.7),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      const SizedBox(width: 30),
    ],
  );
}
