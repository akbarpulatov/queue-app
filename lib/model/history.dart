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
    return '\n\r{ ${this.uID}, ${this.status}, ${this.name}, ${this.averageWaitingTime}, ${this.bookedTime}, ${this.numberOfPeopleInQueue} }';
  }
}

// var createdList = new List<CreatedItem>();
List<CreatedItem> createdList = [
  CreatedItem(
    "000001",
    "Завершено",
    "Клиника AkfaMedline",
    "5 min",
    "10.07.2020 11:51",
    "12",
  ),
  CreatedItem(
    "000002",
    "Закрыто",
    "Клиника ShoxMed",
    "10 min",
    "12.08.2020 08:22",
    "5",
  ),
  CreatedItem(
    "000003",
    "Открыто",
    "Клиника DoctorPlus",
    "22 min",
    "11.09.2020 09:35",
    "14",
  ),
  CreatedItem(
    "000004",
    "Закрыто",
    "Клиника Doctor+",
    "26 min",
    "11.09.2020 15:26",
    "29",
  ),
  CreatedItem(
    "000005",
    "Открыто",
    "Клиника MedService",
    "17 min",
    "11.09.2020 09:35",
    "11",
  ),
  CreatedItem(
    "000006",
    "Завершено",
    "Клиника DoctorPlus",
    "6 min",
    "11.09.2020 10:42",
    "2",
  ),
];

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
    return '\n\r{ ${this.uID}, ${this.status}, ${this.name}, ${this.averageWaitingTime}, ${this.bookedTime}, ${this.orderInQueue} }';
  }
}

List<BookedItem> bookedList = [
  BookedItem(
    "000001",
    "В ожидании",
    "Клиника ShoxMed",
    "22 min",
    "12.08.2020 08:22",
    "10",
  ),
  BookedItem(
    "000002",
    "На приеме",
    "Клиника AkfaMedline",
    "0 min",
    "8.08.2020 08:51",
    "1",
  ),
  BookedItem(
    "000003",
    "Завершено",
    "Паспортный стол",
    "0 min",
    "11.09.2020 09:35",
    "0",
  ),
  BookedItem(
    "000004",
    "Пропущенно",
    "Национальный банк",
    "0 min",
    "11.09.2020 09:35",
    "0",
  ),
  BookedItem(
    "000005",
    "Завершено",
    "Клиника AkfaMedline",
    "5 min",
    "10.07.2020 11:51",
    "12",
  ),
];
