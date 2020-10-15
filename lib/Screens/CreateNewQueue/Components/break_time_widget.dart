import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateQueue/Components/time_picker.dart';

class BreakTimeWidget extends StatefulWidget {
  const BreakTimeWidget({
    Key key,
  }) : super(key: key);

  @override
  _BreakTimeWidgetState createState() => _BreakTimeWidgetState();
}

class _BreakTimeWidgetState extends State<BreakTimeWidget>
    with SingleTickerProviderStateMixin {
  bool hasBreak = true;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (hasBreak) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    return Column(
      children: [
        Row(
          children: [
            Text('Перерыв'),
            CupertinoSwitch(
                value: hasBreak,
                onChanged: (val) {
                  setState(() {
                    hasBreak = val;
                  });
                })
          ],
        ),
        SizeTransition(
          sizeFactor: _controller,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      'С',
                    ),
                    // ============< Begin Time >============
                    TimePicker(
                      initTime: TimeOfDay(hour: 13, minute: 00),
                      onChanged: (val) {
                        // formFieldState.didChange(val);
                      },
                    ),
                  ],
                ),
              ),
              VerticalDivider(),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      'До',
                    ),
                    // ============< End Time >============
                    TimePicker(
                      initTime: TimeOfDay(hour: 14, minute: 00),
                      onChanged: (val) {
                        // formFieldState.didChange(val);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
