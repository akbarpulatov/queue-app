import 'package:flutter/material.dart';
import 'package:flutter_auth/model/queue.dart';

class HomeScreenViewModel extends ChangeNotifier {
  delete(int index) {
    Navbat.bookedQueueList.removeAt(index);
    notifyListeners();
  }
}
