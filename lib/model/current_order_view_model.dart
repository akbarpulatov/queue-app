import 'package:flutter/foundation.dart';
import 'package:flutter_auth/model/queue.dart';

class CreatedQueueModel extends ChangeNotifier {
  int currentOrder(int index) {
    return queueList[index].currentQueue;
  }

  increment(val) {
    queueList[val].currentQueue = queueList[val].currentQueue + 1;
    notifyListeners();
  }
}
