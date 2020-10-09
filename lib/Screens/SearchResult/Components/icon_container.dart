import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    Key key,
    this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: Color(0xFFDEDED5),
      size: 26,
    );
  }
}
