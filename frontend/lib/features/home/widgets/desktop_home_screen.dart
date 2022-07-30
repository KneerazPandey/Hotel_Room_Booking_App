import 'package:flutter/material.dart';
import 'package:frontend/core/controllers/controller.dart';
import 'package:frontend/core/utils/utils.dart';
import 'package:frontend/features/available_room/screen/available_room_screen.dart';
import 'package:frontend/widgets/date_pick_button.dart';
import 'package:frontend/features/home/widgets/increment_decrement_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: AspectRatio(
              aspectRatio: 0.5,
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/hotel_one.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 50,
                ),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Check in Date',
                        style: GoogleFonts.sansita(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: const Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(() {
                        final String formatedDate =
                            dateFormat.format(roomBookController.checkInDate);
                        return DatePickButton(
                          formatedDate: formatedDate,
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: roomBookController.checkInDate,
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2100),
                            );
                            if (newDate == null) {
                              return;
                            }
                            roomBookController.setCheckInDate(newDate);
                          },
                        );
                      }),
                      const SizedBox(height: 20),
                      Text(
                        'Check out Date',
                        style: GoogleFonts.sansita(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: const Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(() {
                        final String formatedDate =
                            dateFormat.format(roomBookController.checkOutDate);
                        return DatePickButton(
                          formatedDate: formatedDate,
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: roomBookController.checkOutDate,
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2100),
                            );
                            if (newDate == null) {
                              return;
                            }
                            roomBookController.setCheckOutDate(newDate);
                          },
                        );
                      }),
                      const SizedBox(height: 25),
                      Divider(
                        color: const Color(0xFFee9a6b).withOpacity(0.2),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFee9a6b),
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          'Selection',
                          style: GoogleFonts.sansita(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: const Color(0xFF333333),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Obx(() {
                        return Wrap(
                          runSpacing: 16,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Adult:',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                IncrementDecrementButton(
                                  text:
                                      roomBookController.adultCount.toString(),
                                  onAdd: () {
                                    int adultCount =
                                        roomBookController.adultCount;
                                    roomBookController
                                        .setAdultCount(adultCount += 1);
                                  },
                                  onRemove: () {
                                    int adultCount =
                                        roomBookController.adultCount;
                                    if (adultCount > 0) {
                                      roomBookController
                                          .setAdultCount(adultCount -= 1);
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                Text(
                                  'Children:',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                IncrementDecrementButton(
                                  text: roomBookController.childrenCount
                                      .toString(),
                                  onAdd: () {
                                    int childrenCount =
                                        roomBookController.childrenCount;
                                    roomBookController
                                        .setChildrenCount(childrenCount += 1);
                                  },
                                  onRemove: () {
                                    int childrenCount =
                                        roomBookController.childrenCount;
                                    if (childrenCount > 0) {
                                      roomBookController
                                          .setChildrenCount(childrenCount -= 1);
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                Text(
                                  'Room:',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                IncrementDecrementButton(
                                  text: roomBookController.roomCount.toString(),
                                  onAdd: () {
                                    int roomCount =
                                        roomBookController.roomCount;
                                    roomBookController
                                        .setRoomCount(roomCount += 1);
                                  },
                                  onRemove: () {
                                    int roomCount =
                                        roomBookController.roomCount;
                                    if (roomCount > 0) {
                                      roomBookController
                                          .setRoomCount(roomCount -= 1);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          if (Utils.searchRoomFound(context: context)) {
                            Navigator.pushNamed(
                                context, AvailableRoomScreen.routeName);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 55),
                          primary: const Color(0xFFee9a6b),
                        ),
                        child: Text(
                          'Search',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
