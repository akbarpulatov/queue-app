import 'package:flutter/material.dart';

class QueueListItem {
  QueueListItem(
    String uID,
    String name,
    int totalQueue,
    int maxQueue,
    DateTime dateCreated,
    DateTime dateEnd,
    TimeOfDay breakTimeBegin,
    TimeOfDay workingTimeEnd,
    bool hasBreak,
    TimeOfDay breakTime,
    TimeOfDay breakTimeEnd,
    String note,
    int currentQueue,
  ) {
    this.name = name;
    this.totalQueue = totalQueue;
    this.maxQueue = maxQueue;
    this.dateCreated = dateCreated;
    this.dateEnd = dateEnd;
    this.workingTimeBegin = workingTimeBegin;
    this.workingTimeEnd = workingTimeEnd;
    this.hasBreak = hasBreak;
    this.breakTimeBegin = breakTimeBegin;
    this.breakTimeEnd = breakTimeEnd;
    this.note = note;
    this.currentQueue = currentQueue;
  }

  String uID;
  String name;
  int totalQueue;
  int maxQueue;
  DateTime dateCreated;
  DateTime dateEnd;
  TimeOfDay workingTimeBegin;
  TimeOfDay workingTimeEnd;
  bool hasBreak;
  TimeOfDay breakTimeBegin;
  TimeOfDay breakTimeEnd;
  String note;
  int currentQueue;

  factory QueueListItem.fromJson(dynamic json) {
    return QueueListItem(
      json['uID'],
      json['name'],
      json['totalQueue'],
      json['maxQueue'],
      json['dateCreated'],
      json['dateEnd'],
      json['workingTimeBegin'],
      json['workingTimeEnd'],
      json['hasBreak'],
      json['breakTimeBegin'],
      json['breakTimeEnd'],
      json['note'],
      json['currentQueue'],
    );
  }

  // @override
  // String toString() {
  //   return '\n\r{ ${this.uID}, ${this.currentOrder}, ${this.name}, ${this.createdTime} }';
  // }
}

// var queueList = List<QueueListItem>();

var newCreate = QueueListItem(
  "",
  "",
  0,
  0,
  DateTime.now(),
  DateTime.now(),
  TimeOfDay(hour: 9, minute: 00),
  TimeOfDay(hour: 18, minute: 00),
  true,
  TimeOfDay(hour: 13, minute: 00),
  TimeOfDay(hour: 14, minute: 00),
  '',
  0,
);

List<QueueListItem> queueList = [
  QueueListItem(
    "000001",
    "",
    0,
    0,
    DateTime(2020, 10, 7, 9, 00),
    DateTime(2020, 10, 20, 18, 00),
    TimeOfDay(hour: 9, minute: 00),
    TimeOfDay(hour: 9, minute: 00),
    true,
    TimeOfDay(hour: 13, minute: 0),
    TimeOfDay(hour: 14, minute: 0),
    'При себе необходимо иметь \nксерокопию паспорта',
    5,
  ),
];
