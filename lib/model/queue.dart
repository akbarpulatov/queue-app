import 'package:flutter/material.dart';

class QueueListItem {
  QueueListItem({
    String uID,
    String name,
    int totalQueue,
    int maxQueue,
    DateTime dateCreated,
    DateTime dateEnd,
    TimeOfDay workingTimeBegin,
    TimeOfDay workingTimeEnd,
    bool hasBreak,
    TimeOfDay breakTimeBegin,
    TimeOfDay breakTimeEnd,
    String note,
    int currentQueue,
  }) {
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
      uID: json['uID'],
      name: json['name'],
      totalQueue: json['totalQueue'],
      maxQueue: json['maxQueue'],
      dateCreated: json['dateCreated'],
      dateEnd: json['dateEnd'],
      workingTimeBegin: json['workingTimeBegin'],
      workingTimeEnd: json['workingTimeEnd'],
      hasBreak: json['hasBreak'],
      breakTimeBegin: json['breakTimeBegin'],
      breakTimeEnd: json['breakTimeEnd'],
      note: json['note'],
      currentQueue: json['currentQueue'],
    );
  }
}

class Navbat {
  static List<QueueListItem> queueList = [
    QueueListItem(
      uID: "000001",
      name: "Клиника DoctorPlus",
      totalQueue: 100,
      maxQueue: 150,
      dateCreated: DateTime(2020, 10, 7, 9, 00),
      dateEnd: DateTime(2020, 10, 20, 18, 00),
      workingTimeBegin: TimeOfDay(hour: 9, minute: 00),
      workingTimeEnd: TimeOfDay(hour: 18, minute: 00),
      hasBreak: true,
      breakTimeBegin: TimeOfDay(hour: 13, minute: 0),
      breakTimeEnd: TimeOfDay(hour: 14, minute: 0),
      note: 'При себе необходимо иметь \nксерокопию паспорта',
      currentQueue: 15,
    ),
    QueueListItem(
      uID: "000001",
      name: "Технический  осмотр автомобиля в ГАИ",
      totalQueue: 100,
      maxQueue: 150,
      dateCreated: DateTime(2020, 10, 7, 9, 00),
      dateEnd: DateTime(2020, 10, 20, 18, 00),
      workingTimeBegin: TimeOfDay(hour: 10, minute: 00),
      workingTimeEnd: TimeOfDay(hour: 17, minute: 00),
      hasBreak: true,
      breakTimeBegin: TimeOfDay(hour: 13, minute: 0),
      breakTimeEnd: TimeOfDay(hour: 14, minute: 0),
      note: 'При себе необходимо иметь \nксерокопию паспорта',
      currentQueue: 34,
    ),
  ];
}
