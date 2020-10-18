import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    Key key,
    this.child,
    this.flex,
    this.fillColor,
    this.borderColor,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final Function onPressed;
  final Color fillColor, borderColor;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: FlatButton(
        color: fillColor,
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: borderColor ?? Colors.black45),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
