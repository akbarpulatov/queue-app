import 'package:flutter/material.dart';
import 'package:flutter_auth/model/queue.dart';

class QueueManageScreenViewModel extends ChangeNotifier {
  int currentOrder(int index) {
    return Navbat.queueList[index].currentQueue;
  }

  increment(int index) {
    Navbat.queueList[index].currentQueue += 1;
    notifyListeners();
  }

  remove(int index) {
    Navbat.queueList.removeAt(index);
    notifyListeners();
  }
}
