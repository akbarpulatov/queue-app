import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({
    Key key,
  }) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _time = new TimeOfDay(hour: 18, minute: 00);

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      print('Time selected: ${_time.toString()}');
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        print('change time');
        _selectTime(context);
      },
      child: Text(
        '${_time.format(context)}',
        style: TextStyle(color: MyColors.greyColorLight, fontSize: 17),
      ),
    );
  }
}
