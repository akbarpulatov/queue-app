import 'package:flutter/material.dart';

class FlatRoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, textColor;
  final IconData icon;
  final int flex;

  const FlatRoundedButton({
    Key key,
    this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.icon,
    this.flex,
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
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(width: 3),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 17,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
