import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/styles.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/time_picker.dart';
import 'package:flutter_auth/constants.dart';

class BreakTimeWidget extends StatefulWidget {
  final FormFieldState state;

  const BreakTimeWidget({
    Key key,
    @required this.state,
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
    var breakData = widget.state.value;

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
                activeColor: kPrimaryColor,
                value: breakData.hasBreak,
                onChanged: (val) {
                  setState(() {
                    breakData.hasBreak = val;
                    widget.state.didChange(breakData);
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
                    Text('С', style: TextStyles.labelStyle1),
                    // ============< Begin Time >============
                    TimePicker(
                      initTime: TimeOfDay(hour: 13, minute: 00),
                      onChanged: (val) {
                        breakData.beginTime = val;
                        widget.state.didChange(breakData);
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
                    Text('До', style: TextStyles.labelStyle1),
                    // ============< End Time >============
                    TimePicker(
                      initTime: TimeOfDay(hour: 14, minute: 00),
                      onChanged: (val) {
                        breakData.endTime = val;
                        widget.state.didChange(breakData);
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
