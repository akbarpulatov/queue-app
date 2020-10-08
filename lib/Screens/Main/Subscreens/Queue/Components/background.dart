import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final Widget foreground;
  const Background({
    Key key,
    this.child,
    this.foreground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          child,
          Positioned(
            child: Container(
              child: foreground,
            ),
            bottom: 0,
          ),
        ],
      ),
    );
  }
}
