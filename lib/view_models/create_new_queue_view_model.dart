import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/model/queue.dart';

class CreateNewQueueViewModel with ChangeNotifier {
  String _uID;
  String _name;
  int _totalQueue;
  int _maxQueue;
  DateTime _dateCreated;
  DateTime _dateEnd;
  TimeOfDay _workingTimeBegin;
  TimeOfDay _workingTimeEnd;
  bool _hasBreak;
  bool _isPaused = false;
  TimeOfDay _breakTimeBegin;
  TimeOfDay _breakTimeEnd;
  String _note;
  int _currentQueue;

  set uID(String val) {
    _uID = val;
  }

  set name(String val) {
    _name = val;
  }

  set totalQueue(int val) {
    _totalQueue = val;
  }

  set maxQueue(int val) {
    _maxQueue = val;
  }

  set dateCreated(DateTime val) {
    _dateCreated = val;
  }

  set dateEnd(DateTime val) {
    _dateEnd = val;
  }

  set workingTimeBegin(TimeOfDay val) {
    _workingTimeBegin = val;
  }

  set workingTimeEnd(TimeOfDay val) {
    _workingTimeEnd = val;
  }

  set hasBreak(bool val) {
    _hasBreak = val;
  }

  set breakTimeBegin(TimeOfDay val) {
    _breakTimeBegin = val;
  }

  set breakTimeEnd(TimeOfDay val) {
    _breakTimeEnd = val;
  }

  set note(String val) {
    _note = val;
  }

  set currentQueue(int val) {
    _currentQueue = val;
  }

  set isPaused(val) {
    _isPaused = val;
  }

  get isPaused {
    return _isPaused;
  }

  create() {
    final _tempDateEnd = _dateCreated.add(Duration(days: 7));

    Navbat.queueList.insert(
      0,
      QueueListItem(
        uID: _uID,
        name: _name,
        totalQueue: 0,
        maxQueue: _maxQueue,
        dateCreated: _dateCreated,
        dateEnd: DateTime(_tempDateEnd.year, _tempDateEnd.month,
            _tempDateEnd.day, _workingTimeEnd.hour, _workingTimeEnd.minute),
        workingTimeBegin: _workingTimeBegin,
        workingTimeEnd: _workingTimeEnd,
        hasBreak: _hasBreak,
        isPaused: _isPaused,
        breakTimeBegin: _breakTimeBegin,
        breakTimeEnd: _breakTimeEnd,
        note: _note,
        currentQueue: 1,
      ),
    );
    notifyListeners();
  }
}
