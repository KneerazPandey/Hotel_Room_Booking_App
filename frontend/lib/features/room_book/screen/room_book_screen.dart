import 'package:flutter/material.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/controllers/controller.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/core/utils/utils.dart';
import 'package:frontend/features/home/screen/home_screen.dart';
import 'package:frontend/features/room_book/services/room_book_services.dart';
import 'package:frontend/widgets/date_pick_button.dart';
import 'package:frontend/features/home/widgets/increment_decrement_button.dart';
import 'package:frontend/models/room.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RoomBookScreen extends StatelessWidget {
  static const String routeName = 'room-book';

  const RoomBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Room room = ModalRoute.of(context)!.settings.arguments as Room;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final DateFormat dateFormat = DateFormat('yyy-MM-dd');
    final RoomBookServices roomBookServices = RoomBookServices();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFefefef),
        title: Text(
          'Book Room',
          style: GoogleFonts.sansita(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isDesktop(context)
                ? 200
                : Responsive.isTablet(context)
                    ? 120
                    : 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "${GlobalUrl.accessImageUrl}/${room.image}/",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                room.name,
                style: GoogleFonts.sansita(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(child: Container()),
                  Text(
                    'Price:- ',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\$${room.price}',
                    style: GoogleFonts.poppins(),
                  ),
                  Expanded(child: Container()),
                  Text(
                    'Size:- ',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${room.roomSize} FT',
                    style: GoogleFonts.poppins(),
                  ),
                  Expanded(child: Container()),
                  Text(
                    'Guest:- ',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    room.guestCount.toString(),
                    style: GoogleFonts.poppins(),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(height: 32),
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
                          text: roomBookController.adultCount.toString(),
                          onAdd: () {
                            int adultCount = roomBookController.adultCount;
                            roomBookController.setAdultCount(adultCount += 1);
                          },
                          onRemove: () {
                            int adultCount = roomBookController.adultCount;
                            if (adultCount > 0) {
                              roomBookController.setAdultCount(adultCount -= 1);
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
                          text: roomBookController.childrenCount.toString(),
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
                            int roomCount = roomBookController.roomCount;
                            roomBookController.setRoomCount(roomCount += 1);
                          },
                          onRemove: () {
                            int roomCount = roomBookController.roomCount;
                            if (roomCount > 0) {
                              roomBookController.setRoomCount(roomCount -= 1);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                );
              }),
              const SizedBox(height: 36),
              ElevatedButton(
                onPressed: () async {
                  if (Utils.searchRoomFound(context: context) == true) {
                    print(
                      roomBookController.checkInDate
                          .toString()
                          .substring(0, 10)
                          .trim(),
                    );
                    bool booked = await roomBookServices.bookRoom(
                      context: context,
                      userId: userController.user.id,
                      roomId: room.id,
                      checkInDate: roomBookController.checkInDate
                          .toString()
                          .substring(0, 10)
                          .trim(),
                      checkOutDate: roomBookController.checkOutDate
                          .toString()
                          .substring(0, 10)
                          .trim(),
                      childCount: roomBookController.childrenCount,
                      adultCount: roomBookController.adultCount,
                      roomCount: roomBookController.roomCount,
                    );
                    if (booked == true) {
                      await Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeScreen.routeName,
                        (route) => false,
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 55),
                  primary: const Color(0xFFee9a6b),
                ),
                child: Text(
                  'Book Room',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
