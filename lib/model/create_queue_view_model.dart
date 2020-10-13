import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateQueueViewModel with ChangeNotifier {
  ///================ hasBreak ================
  bool _hasBreak = true;
  set hasBreak(value) {
    _hasBreak = value;
    notifyListeners();
  }

  get hasBreak {
    return _hasBreak;
  }

  ///================ breakBegin ================
  TimeOfDay _breakBegin = TimeOfDay(hour: 13, minute: 00);

  get breakBegin {
    return _breakBegin;
  }

  set breakBegin(value) {
    _breakBegin = value;
    notifyListeners();
  }

  ///================ breakEnd ================
  TimeOfDay _breakEnd = TimeOfDay(hour: 14, minute: 00);

  get breakEnd {
    return _breakEnd;
  }

  set breakEnd(value) {
    _breakEnd = value;
    notifyListeners();
  }
}
