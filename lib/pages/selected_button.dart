import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedButton extends StatefulWidget {
  SelectedButton({
    super.key,
    required this.onCallback,
    required this.catPriority,
  });

  List<String> catPriority;
  ValueChanged<int> onCallback;

  @override
  State<SelectedButton> createState() {
    return _SelectedButtonState();
  }
}

class _SelectedButtonState extends State<SelectedButton> {
  int selectedIndex = 0;
  Color color = const Color.fromARGB(255, 147, 149, 211);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(widget.catPriority.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                widget.onCallback(selectedIndex);
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? const Color.fromARGB(255, 135, 138, 219)
                    : const Color.fromARGB(255, 135, 138, 219).withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                widget.catPriority[index],
                style: GoogleFonts.jost(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: selectedIndex == index
                      ? Colors.white
                      : const Color.fromARGB(255, 20, 33, 61),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }),
    );
  }
}
