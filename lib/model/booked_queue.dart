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

class BookedQueueOld {
  BookedQueueOld({
    String uID,
    String name,
    String createdTime,
    String order,
    String averageWaitingTime,
    String currentOrder,
    String note,
  }) {
    this.uID = uID;
    this.name = name;
    this.createdTime = createdTime;
    this.order = order;
    this.averageWaitingTime = averageWaitingTime;
    this.currentOrder = currentOrder;
    this.note = note;
  }

  String uID;
  String name;
  String createdTime;
  String order;
  String averageWaitingTime;
  String currentOrder;
  String note;

  factory BookedQueueOld.fromJson(dynamic json) {
    return BookedQueueOld(
      uID: json['uID'],
      name: json['name'],
      createdTime: json['createdTime'],
      order: json['order'],
      averageWaitingTime: json['averageWaitingTime'],
      currentOrder: json['currentOrder'],
      note: json['note'],
    );
  }
}

List<BookedQueueOld> bookedQueueList = [
  BookedQueueOld(
    uID: "11111",
    name: "Технический осмотр автомобиля в ГАИ",
    createdTime: "10.07.2020   10:20",
    order: "137",
    averageWaitingTime: "30 min",
    currentOrder: "15",
    note: "При себе необходимо иметь ксерокопию паспорта",
  ),
  BookedQueueOld(
    uID: "11111",
    name: "Клиника DoctorPlus",
    createdTime: "10.07.2020   17:35",
    order: "10",
    averageWaitingTime: "15 min",
    currentOrder: "3",
    note: "При себе необходимо иметь ксерокопию паспорта",
  ),
  BookedQueueOld(
    uID: "11111",
    name: "Клиника MedService",
    createdTime: "11.09.2020    09:35",
    order: "10",
    averageWaitingTime: "15 min",
    currentOrder: "3",
    note: "При себе необходимо иметь ксерокопию паспорта",
  ),
  BookedQueueOld(
    uID: "11111",
    name: "Клиника Doctor+",
    createdTime: "11.09.2020    10:42",
    order: "10",
    averageWaitingTime: "15 min",
    currentOrder: "3",
    note: "При себе необходимо иметь ксерокопию паспорта",
  ),
];
