import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class FlatTextFieldContainer extends StatelessWidget {
  final Widget child;
  const FlatTextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 0),
      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: child,
    );
  }
}
