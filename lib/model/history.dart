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
  HistoryItemBaseClass();
  int uID;
  Status status;
  String name;
  double averageWaitingTime;
  DateTime bookedTime;
}

class Booked extends HistoryItemBaseClass {
  Booked();
  int orderInQueue;
}

class Created extends HistoryItemBaseClass {
  Created();
  int numberOfPeopleInQueue;
}

class History {
  History();

  String testString;
  List<Created> createdList;
  List<Booked> bookedList;

  int myfunction() {
    print("Class function was called!");
    return 1;
  }
}

var history = History();
