import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/date_picker.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/date_time_field_container.dart';

class QueueListItem {
  QueueListItem(
    String uID,
    String name,
    int totalQueue,
    int maxQueue,
    DateTime dateCreated,
    DateTime dateFinish,
    TimeOfDay breakTimeBegin,
    TimeOfDay workingTimeFinish,
    bool hasBreak,
    TimeOfDay breakTime,
    TimeOfDay breakTimeFinish,
    String note,
    int currentQueue,
  ) {
    this.name = name;
    this.totalQueue = totalQueue;
    this.maxQueue = maxQueue;
    this.dateCreated = dateCreated;
    this.dateFinish = dateFinish;
    this.workingTimeBegin = workingTimeBegin;
    this.workingTimeFinish = workingTimeFinish;
    this.hasBreak = hasBreak;
    this.breakTimeBegin = breakTimeBegin;
    this.breakTimeFinish = breakTimeFinish;
    this.note = note;
    this.currentQueue = currentQueue;
  }

  String uID;
  String name;
  int totalQueue;
  int maxQueue;
  DateTime dateCreated;
  DateTime dateFinish;
  TimeOfDay workingTimeBegin;
  TimeOfDay workingTimeFinish;
  bool hasBreak;
  TimeOfDay breakTimeBegin;
  TimeOfDay breakTimeFinish;
  String note;
  int currentQueue;

  factory QueueListItem.fromJson(dynamic json) {
    return QueueListItem(
      json['uID'],
      json['name'],
      json['totalQueue'],
      json['maxQueue'],
      json['dateCreated'],
      json['dateFinish'],
      json['workingTimeBegin'],
      json['workingTimeFinish'],
      json['hasBreak'],
      json['breakTimeBegin'],
      json['breakTimeFinish'],
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

List<QueueListItem> queueList = [
  QueueListItem(
    "000001",
    "Клиника AkfaMedline",
    100,
    150,
    DateTime(2020, 10, 7, 9, 00),
    DateTime(2020, 10, 20, 18, 00),
    TimeOfDay(hour: 9, minute: 0),
    TimeOfDay(hour: 9, minute: 0),
    true,
    TimeOfDay(hour: 13, minute: 0),
    TimeOfDay(hour: 14, minute: 0),
    'При себе необходимо иметь \nксерокопию паспорта',
    5,
  ),
  // QueueListItem(
  //   "000002",
  //   "34",
  //   "Клиника ShoxMed",
  //   "10.07.2020   10:00",
  // ),
  // QueueListItem(
  //   "000003",
  //   "34",
  //   "Технический осмотр автомобиля \nв ГАИ",
  //   "15:09:2020   07:26",
  // ),
];
