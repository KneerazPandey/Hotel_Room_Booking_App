import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/features/room_book/screen/room_book_screen.dart';
import 'package:frontend/features/service/services/hotel_room_services.dart';
import 'package:frontend/features/service/widget/room_service_tile.dart';
import 'package:frontend/models/room.dart';
import 'package:frontend/widgets/custom_snack_bar.dart';

import 'package:google_fonts/google_fonts.dart';

class ServiceScreen extends StatefulWidget {
  static const String routeName = 'Service';

  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final HotelRoomServices _hotelRoomServices = HotelRoomServices();
  List<Room> _rooms = [];

  @override
  void initState() {
    getRooms();
    super.initState();
  }

  void getRooms() async {
    List<Room> roomList =
        await _hotelRoomServices.getAllHotelRooms(context: context);
    setState(() {
      _rooms = roomList;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          color: const Color(0xFFefefef),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                              color: Colors.blue.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/nice.jpeg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Reserve Room Now',
                            style: GoogleFonts.cuprum(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: [
                              const Icon(
                                Icons.phone_outlined,
                                color: Colors.white,
                                size: 32,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '9854236985',
                                style: GoogleFonts.cuprum(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Get 5% off through direct call',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'All Rooms in our Hotel',
                  style: GoogleFonts.sansita(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 250,
                  height: 8,
                  color: Colors.red,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _rooms.length,
                    itemBuilder: (BuildContext context, int index) {
                      Room room = _rooms[index];
                      return InkWell(
                        onTap: () {
                          if (room.availability) {
                            Navigator.pushNamed(
                              context,
                              RoomBookScreen.routeName,
                              arguments: room,
                            );
                          } else {
                            CustomSnackBar.showSnackBar(
                              context: context,
                              text: 'This room is currently not available',
                            );
                          }
                        },
                        child: RoomServiceTile(
                          room: room,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                if (Responsive.isDesktop(context))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildWhatWeOffer(),
                      buildMainContact(),
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
                          buildMainContact(),
                          const SizedBox(height: 20),
                          buildStayTuned(),
                        ],
                      ),
                    ],
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
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
        const SizedBox(height: 32),
      ],
    );
  }

  Column buildMainContact() {
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
              'Our Contact Details',
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
              const SizedBox(height: 10),
              Text(
                '+9779854123658',
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
