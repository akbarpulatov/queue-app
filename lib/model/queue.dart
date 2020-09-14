import 'package:flutter/foundation.dart';

class QueueListItem {
  QueueListItem(
      String uID, String currentOrder, String name, String createdTime) {
    this.uID = uID;
    this.currentOrder = currentOrder;
    this.name = name;
    this.createdTime = createdTime;
  }

  @required
  String uID;
  @required
  String name;
  @required
  String createdTime;
  @required
  String currentOrder;

  factory QueueListItem.fromJson(dynamic json) {
    return QueueListItem(
      json['uID'],
      json['currentOrder'],
      json['name'],
      json['createdTime'],
    );
  }

  @override
  String toString() {
    return '\n\r{ ${this.uID}, ${this.currentOrder}, ${this.name}, ${this.createdTime} }';
  }
}

var queueList = List<QueueListItem>();
