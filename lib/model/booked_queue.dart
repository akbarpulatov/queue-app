import 'package:flutter/material.dart';

class BookedQueue {
  String uID;
  String name;
  Duration averageWaitingTime;
  TimeOfDay workingTimeBegin;
  TimeOfDay workingTimeEnd;
  TimeOfDay breakTimeBegin;
  TimeOfDay breakTimeEnd;
  int totalQueue;
  int myQueue;
  String note;
  int currentQueue;
  bool isPaused;
  DateTime bookedTime;

  BookedQueue({
    String uID,
    String name,
    Duration averageWaitingTime,
    TimeOfDay workingTimeBegin,
    TimeOfDay workingTimeEnd,
    TimeOfDay breakTimeBegin,
    TimeOfDay breakTimeEnd,
    int totalQueue,
    int myQueue,
    String note,
    int currentQueue,
    bool isPaused,
    DateTime bookedTime,
  }) {
    this.uID = uID;
    this.name = name;
    this.averageWaitingTime = averageWaitingTime;
    this.workingTimeBegin = workingTimeBegin;
    this.workingTimeEnd = workingTimeEnd;
    this.breakTimeBegin = breakTimeBegin;
    this.breakTimeEnd = breakTimeEnd;
    this.totalQueue = totalQueue;
    this.myQueue = myQueue;
    this.note = note;
    this.currentQueue = currentQueue;
    this.isPaused = isPaused;
    this.bookedTime = bookedTime;
  }
}
