import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddUpdateButton extends StatelessWidget {
  AddUpdateButton({super.key, required this.btnText, required this.onButtonClicked});

  String btnText;
  final VoidCallback onButtonClicked;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onButtonClicked,
      style: FilledButton.styleFrom(
        backgroundColor:
        const Color.fromARGB(255, 147, 149, 211),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
      ),
      child: Text(
        btnText,
        style: GoogleFonts.jost(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}