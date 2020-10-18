import 'package:flutter/material.dart';
import 'package:flutter_auth/model/booked_queue.dart';
import 'package:flutter_auth/model/queue.dart';

class SearchResultViewModel extends ChangeNotifier {
  bool isInQueueAlready() {
    bool found = false;
    for (var i = 0; i < Navbat.bookedQueueList.length; i++) {
      if (Navbat.bookedQueueList[i].uID == Navbat.searchResult.uID)
        found = true;
    }
    return found;
  }

  addQueue() {
    if (isInQueueAlready() == false) {
      Navbat.bookedQueueList.insert(
          0,
          BookedQueue(
            uID: Navbat.searchResult.uID,
            name: Navbat.searchResult.name,
            averageWaitingTime: Navbat.searchResult.averageWaitingTime,
            bookedTime: DateTime.now(),
            myQueue: Navbat.searchResult.totalQueue + 1,
            currentQueue: Navbat.searchResult.currentQueue,
            note: Navbat.searchResult.note,
          ));
    }
  }
}
