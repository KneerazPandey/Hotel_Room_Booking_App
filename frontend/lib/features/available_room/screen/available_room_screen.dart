import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/core/responsive/responsive.dart';
import 'package:frontend/features/available_room/services/available_room_services.dart';
import 'package:frontend/features/room_book/screen/room_book_screen.dart';
import 'package:frontend/features/service/widget/room_service_tile.dart';
import 'package:frontend/models/room.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class AvailableRoomScreen extends StatefulWidget {
  static const String routeName = 'available-room';

  const AvailableRoomScreen({Key? key}) : super(key: key);

  @override
  State<AvailableRoomScreen> createState() => _AvailableRoomScreenState();
}

class _AvailableRoomScreenState extends State<AvailableRoomScreen> {
  final AvailableRoomServices _availableRoomServices = AvailableRoomServices();
  List<Room> _availableRooms = [];

  @override
  void initState() {
    getRooms();
    super.initState();
  }

  void getRooms() async {
    Response res = await _availableRoomServices.getHotelRooms(context: context);
    Map map = json.decode(res.body) as Map;
    List<dynamic> availableRoomsList = map['available_rooms'] as List;
    List<Room> rooms = [];

    for (var element in availableRoomsList) {
      rooms.add(Room.fromMap(element));
    }

    setState(() {
      _availableRooms = rooms;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFefefef),
        title: Text(
          'Available Room',
          style: GoogleFonts.sansita(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Available rooms',
              style: GoogleFonts.sansita(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 200,
              height: 6,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            Container(
              width: width,
              height: (350 * _availableRooms.length).toDouble(),
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isDesktop(context)
                    ? 160
                    : Responsive.isTablet(context)
                        ? 90
                        : 30,
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _availableRooms.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoomBookScreen.routeName,
                        arguments: _availableRooms[index],
                      );
                    },
                    child: RoomServiceTile(
                      height: 320,
                      room: _availableRooms[index],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
