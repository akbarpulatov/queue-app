import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    Key key,
    this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Icon(
        iconData,
        color: Color(0xFFDEDED5),
        size: 26,
      ),
    );
  }
}
