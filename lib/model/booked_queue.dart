import 'package:flutter/foundation.dart';

class BookedQueue {
  BookedQueue(
    String uID,
    String name,
    String createdTime,
    String order,
    String averageWaitingTime,
    String currentOrder,
    String note,
  ) {
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
      json['uID'],
      json['name'],
      json['createdTime'],
      json['order'],
      json['averageWaitingTime'],
      json['currentOrder'],
      json['note'],
    );
  }

  @override
  String toString() {
    return '\n\r{ ${this.uID}, ${this.name}, ${this.createdTime}, ${this.order}, ${this.averageWaitingTime}, ${this.currentOrder}, ${this.note} }';
  }
}

// var bookedQueueList = List<BookedQueue>();
List<BookedQueue> bookedQueueList = [
  BookedQueue(
    "11111",
    "Технический осмотр автомобиля в ГАИ",
    "10.07.2020   10:20",
    "137",
    "30 min",
    "15",
    "При себе необходимо иметь ксерокопию паспорта",
  ),
  BookedQueue(
    "11111",
    "Клиника DoctorPlus",
    "10.07.2020   17:35",
    "10",
    "15 min",
    "3",
    "При себе необходимо иметь ксерокопию паспорта",
  ),
  BookedQueue(
    "11111",
    "Клиника MedService",
    "11.09.2020 09:35",
    "10",
    "15 min",
    "3",
    "При себе необходимо иметь ксерокопию паспорта",
  ),
  BookedQueue(
    "11111",
    "Клиника Doctor+",
    "11.09.2020 10:42",
    "10",
    "15 min",
    "3",
    "При себе необходимо иметь ксерокопию паспорта",
  ),
];
