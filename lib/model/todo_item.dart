import 'package:flutter/material.dart';

class TodoItem {
  TodoItem({
    this.taskName = "",
    this.taskCategory = "",
    DateTime? date,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    this.priority = "",
    this.description = "",
    bool? isDone
  })  : date = date ?? DateTime.now(),
        startTime = startTime ?? TimeOfDay.now(),
        endTime = endTime ?? TimeOfDay.now(),
        isDone = isDone ?? false;

  String taskName;
  String taskCategory;
  DateTime date;
  TimeOfDay startTime;
  TimeOfDay endTime;
  String priority;
  String description;
  bool isDone;

  TodoItem copyWith({
    String? taskName,
    String? taskCategory,
    DateTime? date,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? priority,
    String? description,
    bool? isDone,
  }) {
    return TodoItem(
      taskName: taskName ?? this.taskName,
      taskCategory: taskCategory ?? this.taskCategory,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      priority: priority ?? this.priority,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
