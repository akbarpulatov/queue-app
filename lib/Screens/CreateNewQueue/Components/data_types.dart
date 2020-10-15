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
