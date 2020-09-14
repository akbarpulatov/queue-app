import 'package:flutter/foundation.dart';

class HistoryListItemBaseClass {
  HistoryListItemBaseClass(String uID, String status, String name,
      String averageWaitingTime, String bookedTime) {
    this.uID = uID;
    this.status = status;
    this.name = name;
    this.averageWaitingTime = averageWaitingTime;
    this.bookedTime = bookedTime;
  }

  @required
  String uID;
  @required
  String status;
  @required
  String name;
  @required
  String averageWaitingTime;
  @required
  String bookedTime;

  factory HistoryListItemBaseClass.fromJson(dynamic json) {
    return HistoryListItemBaseClass(
      json['uID'],
      json['status'],
      json['name'],
      json['averageWaitingTime'],
      json['bookedTime'],
    );
  }
}
