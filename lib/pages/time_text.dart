import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../util/formatter_date_time.dart';


class TimeText extends StatefulWidget {
  TimeText({super.key, required this.timeIcon, required this.onCallBack});

  IconData timeIcon;
  TimeCallback onCallBack;

  @override
  State<TimeText> createState() {
    return _TimeText();
  }
}

class _TimeText extends State<TimeText> {
  DateTime? calendar;
  TimeOfDay? time;

  Future<void> openDialog() async {
    if (widget.timeIcon == Icons.calendar_today_outlined) {
      calendar = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(9999, 12, 31),
      );
    } else {
      time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
    }
    setState(() {});
  }

  get timeValue {
    if (widget.timeIcon == Icons.calendar_today_outlined) {
      if (calendar == null) {
        return DateFormat("dd MMMM, EEEE").format(DateTime.now());
      } else {
        return DateFormat("dd MMMM, EEEE").format(calendar!);
      }
    } else {
      if (time == null) {
        return timeFormatter(DateTime.now());
      } else {
        return formatTimeOfDay(time!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: const Color.fromARGB(255, 147, 149, 211),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: () async {
          await openDialog();
          widget.onCallBack(calendar, time);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  timeValue,
                  style: GoogleFonts.jost(
                    color: const Color.fromARGB(255, 20, 33, 61),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                widget.timeIcon,
                color: const Color.fromARGB(255, 147, 149, 211),
              )
            ],
          ),
        ),
      ),
    );
  }
}
