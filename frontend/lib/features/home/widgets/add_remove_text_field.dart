import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRemoveTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final VoidCallback onRemove;
  final VoidCallback onAdd;

  const AddRemoveTextField({
    Key? key,
    required this.text,
    required this.controller,
    required this.onRemove,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: TextField(
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(color: Colors.black),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: text,
          prefixIcon: IconButton(
            icon: const Icon(Icons.remove),
            onPressed: onRemove,
          ),
          suffixIcon: IconButton(
            onPressed: onAdd,
            icon: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
