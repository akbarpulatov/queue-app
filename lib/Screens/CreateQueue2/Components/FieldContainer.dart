import 'package:flutter/material.dart';

class FieldContainer extends StatelessWidget {
  const FieldContainer({
    Key key,
    @required this.leading,
    @required this.trailing,
    this.isStretched,
  }) : super(key: key);
  final Widget leading;
  final Widget trailing;
  final bool isStretched;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        if (isStretched == true)
          Expanded(
            child: SizedBox(),
          ),
        trailing,
      ],
    );
  }
}
