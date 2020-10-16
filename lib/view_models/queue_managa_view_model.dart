import 'package:flutter/material.dart';
import 'package:flutter_auth/model/queue.dart';

class QueueManageScreenViewModel extends ChangeNotifier {
  int currentOrder(int index) {
    return Navbat.queueList[index].currentQueue;
  }

  increment(val) {
    Navbat.queueList[val].currentQueue = Navbat.queueList[val].currentQueue + 1;
    notifyListeners();
  }
}
