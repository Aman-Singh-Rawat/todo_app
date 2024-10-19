import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef TimeCallback = void Function(DateTime?, TimeOfDay?);
DateFormat formatter = DateFormat("hh:mm a") ;

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  final formattedTime = formatter.format(dateTime);
  return formattedTime;
}

String timeFormatter(DateTime time) {
  return  formatter.format(time);

}