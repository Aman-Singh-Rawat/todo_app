import 'package:flutter/material.dart';
import 'package:to_do_app/pages/task_text.dart';
import 'package:to_do_app/pages/time_text.dart';

import '../util/formatter_date_time.dart';

class TimeWidget extends StatelessWidget {
  TimeWidget({
    required this.timeText,
    required this.timeIcon,
    required this.onCallBack,
    super.key,
  });

  String timeText;
  IconData timeIcon;
  TimeCallback onCallBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TaskText(taskTextTitle: timeText),
        TimeText(
          onCallBack: onCallBack,
          timeIcon: timeIcon,
        )
      ],
    );
  }
}
