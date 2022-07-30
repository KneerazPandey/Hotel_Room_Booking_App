import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IncrementDecrementButton extends StatelessWidget {
  final String text;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const IncrementDecrementButton({
    Key? key,
    required this.text,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.8),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onRemove,
            icon: const Icon(
              Icons.remove,
              color: Color(0xFF333333),
            ),
          ),
          Text(
            text,
            style: GoogleFonts.sansita(
              color: const Color(0xFF333333),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Color(0xFF333333),
            ),
            onPressed: onAdd,
          ),
        ],
      ),
    );
  }
}
