import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskText extends StatelessWidget {
  TaskText({super.key, required this.taskTextTitle});

  String taskTextTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          taskTextTitle,
          style: GoogleFonts.jost(
            color: const Color.fromARGB(255, 20, 33, 61),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
