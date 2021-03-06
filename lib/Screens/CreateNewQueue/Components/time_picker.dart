import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/styles.dart';

class TimePicker extends StatefulWidget {
  final TimeOfDay initTime;
  final void Function(TimeOfDay val) onChanged;
  const TimePicker({
    Key key,
    this.initTime,
    this.onChanged,
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
      setState(() {
        _time = picked;
        widget.onChanged(_time);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _time = widget.initTime;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: 0,
      onPressed: () {
        _selectTime(context);
      },
      child: Text(
        '${_time.format(context)}',
        style: TextStyles.textStyle,
      ),
    );
  }
}
