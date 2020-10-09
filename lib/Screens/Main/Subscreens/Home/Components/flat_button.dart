import 'package:flutter/material.dart';

class FlatRoundedButton extends StatelessWidget {
  final TextStyle textStyle;
  final String text;
  final Function onPressed;
  final Color color;
  final IconData icon;
  final double width;
  final int flex;

  const FlatRoundedButton({
    Key key,
    this.text,
    this.onPressed,
    this.color,
    this.icon,
    this.flex,
    this.textStyle,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: flex,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 50,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                ),
              if (icon != null) SizedBox(width: 3),
              Text(text, style: textStyle)
            ],
          ),
        ),
      ),
    );
  }
}
