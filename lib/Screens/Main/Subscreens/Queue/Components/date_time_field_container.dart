import 'package:flutter/material.dart';
import 'package:flutter_auth/components/flat_text_field_container.dart';

class DateTimeFieldContainer extends StatefulWidget {
  const DateTimeFieldContainer({
    Key key,
  }) : super(key: key);

  @override
  _DateTimeFieldContainerState createState() => _DateTimeFieldContainerState();
}

class _DateTimeFieldContainerState extends State<DateTimeFieldContainer> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2021));

    if (picked != null && picked != _date) {
      print('Date selected: ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

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
    return FlatTextFieldContainer(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Конец',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 16,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              print('change time');
              _selectTime(context);
            },
            child: Text('${_time.format(context) ?? '18:00'}'),
          ),
        ],
      ),
    );
  }
}
