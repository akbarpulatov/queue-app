import 'package:flutter/foundation.dart';

class BookedQueue {
  BookedQueue({
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

  @required
  String uID;
  @required
  String name;
  @required
  String createdTime;
  @required
  String order;
  @required
  String averageWaitingTime;
  @required
  String currentOrder;
  @required
  String note;

  factory BookedQueue.fromJson(dynamic json) {
    return BookedQueue(
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

List<BookedQueue> bookedQueueList = [
  BookedQueue(
    uID: "11111",
    name: "Технический осмотр автомобиля в ГАИ",
    createdTime: "10.07.2020   10:20",
    order: "137",
    averageWaitingTime: "30 min",
    currentOrder: "15",
    note: "При себе необходимо иметь ксерокопию паспорта",
  ),
  BookedQueue(
    uID: "11111",
    name: "Клиника DoctorPlus",
    createdTime: "10.07.2020   17:35",
    order: "10",
    averageWaitingTime: "15 min",
    currentOrder: "3",
    note: "При себе необходимо иметь ксерокопию паспорта",
  ),
  BookedQueue(
    uID: "11111",
    name: "Клиника MedService",
    createdTime: "11.09.2020    09:35",
    order: "10",
    averageWaitingTime: "15 min",
    currentOrder: "3",
    note: "При себе необходимо иметь ксерокопию паспорта",
  ),
  BookedQueue(
    uID: "11111",
    name: "Клиника Doctor+",
    createdTime: "11.09.2020    10:42",
    order: "10",
    averageWaitingTime: "15 min",
    currentOrder: "3",
    note: "При себе необходимо иметь ксерокопию паспорта",
  ),
];
