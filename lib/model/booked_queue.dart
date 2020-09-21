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

var bookedQueueList = List<BookedQueue>();
