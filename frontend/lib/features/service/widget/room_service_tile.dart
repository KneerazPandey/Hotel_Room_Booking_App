import 'package:flutter/material.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/models/room.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomServiceTile extends StatelessWidget {
  final Room room;
  final double? width;
  final double? height;

  const RoomServiceTile({
    Key? key,
    required this.room,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 280,
      height: height ?? 280,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("${GlobalUrl.accessImageUrl}/${room.image}/"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.2),
            offset: const Offset(2, 2),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FittedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFee9a6b).withOpacity(0.6),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    child: Text(
                      'FROM ${room.price}\$',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  room.name,
                  style: GoogleFonts.sansita(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${room.guestCount} GUESTS',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    Expanded(child: Container()),
                    const Icon(
                      Icons.square_foot,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${room.roomSize} FT',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
