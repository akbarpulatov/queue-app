import 'package:flutter/material.dart';
import 'package:flutter_auth/components/flat_text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class DateTimeFieldContainer extends StatefulWidget {
  final String label;
  final Widget child;
  const DateTimeFieldContainer({
    Key key,
    this.child,
    this.label,
  }) : super(key: key);

  @override
  _DateTimeFieldContainerState createState() => _DateTimeFieldContainerState();
}

class _DateTimeFieldContainerState extends State<DateTimeFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return FlatTextFieldContainer(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              widget.label,
              style: TextStyle(
                color: MyColors.greyColorLight,
                fontSize: 16,
              ),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
