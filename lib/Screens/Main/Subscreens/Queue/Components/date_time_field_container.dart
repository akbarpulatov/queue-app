import 'package:flutter/material.dart';
import 'package:flutter_auth/components/flat_text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class DateTimeFieldContainer extends StatefulWidget {
  final bool isStretched;
  final String label;
  final Widget child;
  const DateTimeFieldContainer({
    Key key,
    this.child,
    this.label,
    this.isStretched,
  }) : super(key: key);

  @override
  _DateTimeFieldContainerState createState() => _DateTimeFieldContainerState();
}

class _DateTimeFieldContainerState extends State<DateTimeFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return FlatTextFieldContainer(
      child: Row(
        children: [
          Text(
            widget.label,
            style: MyStyles.dimmedText,
          ),
          if (widget.isStretched) Expanded(child: SizedBox()),
          if (widget.child != null) widget.child,
        ],
      ),
    );
  }
}
