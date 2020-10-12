import 'package:flutter/foundation.dart';
import 'package:flutter_auth/model/queue.dart';

class CreatedQueueModel extends ChangeNotifier {
  String currentOrder(int index) {
    return queueList[index].currentOrder;
  }

  increment(val) {
    queueList[val].currentOrder =
        (int.parse(queueList[val].currentOrder) + 1).toString();

    notifyListeners();
  }
}
