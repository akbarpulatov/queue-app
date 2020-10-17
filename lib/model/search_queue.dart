import 'package:flutter/material.dart';

class SearchListItem {
  SearchListItem({
    String uID,
    String name,
    Duration averageWaitingTime,
    TimeOfDay workingTimeBegin,
    TimeOfDay workingTimeEnd,
    TimeOfDay breakTimeBegin,
    TimeOfDay breakTimeEnd,
    int totalQueue,
    String note,
    int currentQueue,
    bool isPaused,
  }) {
    this.uID = uID;
    this.name = name;
    this.averageWaitingTime = averageWaitingTime;
    this.workingTimeBegin = workingTimeBegin;
    this.workingTimeEnd = workingTimeEnd;
    this.breakTimeBegin = breakTimeBegin;
    this.breakTimeEnd = breakTimeEnd;
    this.totalQueue = totalQueue;
    this.note = note;
    this.currentQueue = currentQueue;
    this.isPaused = isPaused;
  }

  String uID;
  String name;
  Duration averageWaitingTime;
  TimeOfDay workingTimeBegin;
  TimeOfDay workingTimeEnd;
  TimeOfDay breakTimeBegin;
  TimeOfDay breakTimeEnd;
  int totalQueue;
  String note;
  int currentQueue;
  bool isPaused;
}
