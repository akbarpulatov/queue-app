import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/styles.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/time_picker.dart';

class BreakTimeWidget extends StatefulWidget {
  final FormFieldState formFieldState;

  const BreakTimeWidget({
    Key key,
    @required this.formFieldState,
  }) : super(key: key);

  @override
  _BreakTimeWidgetState createState() => _BreakTimeWidgetState();
}

class _BreakTimeWidgetState extends State<BreakTimeWidget>
    with SingleTickerProviderStateMixin {
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
    var breakData = widget.formFieldState.value;

    if (breakData.hasBreak) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text('Перерыв', style: TextStyles.labelStyle)),
            CupertinoSwitch(
                value: breakData.hasBreak,
                onChanged: (val) {
                  setState(() {
                    breakData.hasBreak = val;
                    widget.formFieldState.didChange(breakData);
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
                    Text('С', style: TextStyles.labelStyle),
                    // ============< Begin Time >============
                    TimePicker(
                      initTime: TimeOfDay(hour: 13, minute: 00),
                      onChanged: (val) {
                        breakData.beginTime = val;
                        widget.formFieldState.didChange(breakData);
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
                    Text('До', style: TextStyles.labelStyle),
                    // ============< End Time >============
                    TimePicker(
                      initTime: TimeOfDay(hour: 14, minute: 00),
                      onChanged: (val) {
                        breakData.endTime = val;
                        widget.formFieldState.didChange(breakData);
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
