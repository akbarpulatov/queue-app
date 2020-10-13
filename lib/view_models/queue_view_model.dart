import 'package:flutter/foundation.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/queue_screen.dart';

class QueueViewModel with ChangeNotifier {
  StateOfQueueScreen _stateOfQueueScreen = StateOfQueueScreen.showList;
  StateOfQueueScreen get stateOfQueueScreen => _stateOfQueueScreen;

  set setQueueScreenState(StateOfQueueScreen val) {
    _stateOfQueueScreen = val;

    notifyListeners();
  }

  String _label = 'Список очередей';

  String get label => _label;
  set label(String val) {
    _label = val;
    notifyListeners();
  }
}
