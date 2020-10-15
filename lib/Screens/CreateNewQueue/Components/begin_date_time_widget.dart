import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/date_picker.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/time_picker.dart';

class BeginDateTimeWidget extends StatelessWidget {
  const BeginDateTimeWidget({
    Key key,
    this.state,
  }) : super(key: key);

  final FormFieldState state;

  @override
  Widget build(BuildContext context) {
    var dateAndTime = state.value;

    return Row(
      children: [
        Expanded(child: Text('Начало')),
        DatePicker(
          onChanged: (val) {
            dateAndTime.dateTime = val;
            state.didChange(dateAndTime);
          },
        ),
        TimePicker(
          initTime: TimeOfDay(hour: 9, minute: 00),
          onChanged: (val) {
            dateAndTime.timeOfDay = val;
            state.didChange(dateAndTime);
          },
        ),
      ],
    );
  }
}
