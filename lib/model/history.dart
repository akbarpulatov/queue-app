import 'package:flutter/foundation.dart';

enum Status {
  // Na priyome
  atReception,

  // V ojidanii
  waiting,

  // Zaversheno
  completed,

  // Propusheno
  missed,

  // otmeneno
  cancelled
}

class HistoryItemBaseClass {
  HistoryItemBaseClass(uID, status, name, averageWaitingTime, bookedTime) {
    this.uID = uID;
    this.status = status;
    this.name = name;
    this.averageWaitingTime = averageWaitingTime;
    this.bookedTime = bookedTime;
  }

  int uID;
  Status status;
  String name;
  double averageWaitingTime;
  DateTime bookedTime;
}

class Booked extends HistoryItemBaseClass {
  Booked() : super(null, null, null, null, null) {}
  int orderInQueue;
}

class Created extends HistoryItemBaseClass {
  Created(
    int uID,
    Status status,
    String name,
    double averageWaitingTime,
    DateTime bookedTime,
    int numberOfPeopleInQueue,
  ) : super(uID, status, name, averageWaitingTime, bookedTime) {
    this.numberOfPeopleInQueue = numberOfPeopleInQueue;
  }
  int numberOfPeopleInQueue;
}

class History {
  History();

  final List<String> nameList = [
    "Clinics of Doctor+",
    "Akfa Medline",
    "Medservice",
    "Advokature",
    "Prokuratura",
    "Sud",
  ];
  List<Created> createdList = [
    Created(12, Status.atReception, "Clinic1", 5.0, DateTime.now(), 15),
    Created(12, Status.completed, "Clinic2", 5.0, DateTime.now(), 15),
    Created(12, Status.atReception, "Clinic3", 5.0, DateTime.now(), 15),
    Created(12, Status.atReception, "Clinic4", 5.0, DateTime.now(), 15),
  ];
  List<Booked> bookedList;

  int myfunction() {
    print("Class function was called!");
    return 1;
  }

  /// This method is called when
  void updateCreatedList(String jsonRaw) {
    //TODO: gets JSON as argument and updates booked list
    for (var i = 0; i < 5; i++) {
      createdList.add(Created(i * 5, Status.atReception, nameList[i], i + 5.0,
          DateTime.now(), i + 5));
    }
  }
}

var history = History();

//============================< New History Class >============================
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
}

var bookedList = new List<BookedItem>();
