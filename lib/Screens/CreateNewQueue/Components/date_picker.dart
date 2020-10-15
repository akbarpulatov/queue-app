import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/styles.dart';
import 'package:flutter_auth/constants.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final void Function(DateTime val) onChanged;

  const DatePicker({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _date = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
    );

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        widget.onChanged(_date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        _selectDate(context);
      },
      child: Text(
        '${DateFormat('yyyy-MM-dd').format(_date)}',
        style: TextStyles.textStyle,
      ),
    );
  }
}
