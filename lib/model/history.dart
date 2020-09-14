import 'package:flutter/foundation.dart';
import 'package:flutter_auth/model/history_list_item_base_class.dart';

//============================< CreatedItem Class >============================
class CreatedItem extends HistoryListItemBaseClass {
  CreatedItem(String uID, String status, String name, String averageWaitingTime,
      String bookedTime, String numberOfPeopleInQueue)
      : super(uID, status, name, averageWaitingTime, bookedTime) {
    this.numberOfPeopleInQueue = numberOfPeopleInQueue;
  }

  @required
  String numberOfPeopleInQueue;

  factory CreatedItem.fromJson(dynamic json) {
    return CreatedItem(
      json['uID'],
      json['status'],
      json['name'],
      json['averageWaitingTime'],
      json['bookedTime'],
      json['numberOfPeopleInQueue'],
    );
  }

  @override
  String toString() {
    return '{ $this.uID, $this.status, $this.name, $this.averageWaitingTime, $this.bookedTime, $this.numberOfPeopleInQueue }';
  }
}

var createdList = new List<CreatedItem>();

//============================< BookedItem Class >============================
class BookedItem extends HistoryListItemBaseClass {
  BookedItem(String uID, String status, String name, String averageWaitingTime,
      String bookedTime, String orderInQueue)
      : super(uID, status, name, averageWaitingTime, bookedTime) {
    this.orderInQueue = orderInQueue;
  }

  @required
  String orderInQueue;

  factory BookedItem.fromJson(dynamic json) {
    return BookedItem(
      json['uID'],
      json['status'],
      json['name'],
      json['averageWaitingTime'],
      json['bookedTime'],
      json['orderInQueue'],
    );
  }

  @override
  String toString() {
    return '{ $this.uID, $this.status, $this.name, $this.averageWaitingTime, $this.bookedTime, $this.orderInQueue }';
  }
}

var bookedList = new List<BookedItem>();
