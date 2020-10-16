import 'package:flutter/material.dart';

class Break {
  bool hasBreak;
  TimeOfDay beginTime;
  TimeOfDay endTime;

  Break() {
    hasBreak = true;
    beginTime = TimeOfDay(hour: 13, minute: 00);
    endTime = TimeOfDay(hour: 14, minute: 00);
  }

  @override
  String toString() {
    return 'Break time fields are: $hasBreak, : $beginTime, : $endTime';
  }
}

class DateAndTime {
  DateTime dateTime;
  TimeOfDay timeOfDay;

  DateAndTime() {
    dateTime = DateTime.now();
    timeOfDay = TimeOfDay(hour: 9, minute: 00);
  }

  get merged {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, timeOfDay.hour,
        timeOfDay.minute);
  }

  @override
  String toString() {
    return '$merged';
  }
}
