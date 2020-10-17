import 'package:flutter/material.dart';
import 'package:flutter_auth/model/booked_queue.dart';
import 'package:flutter_auth/model/queue.dart';

class SearchResultViewModel extends ChangeNotifier {
  addQueue() {
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
