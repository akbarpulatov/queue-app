import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class FlatButtonForProfileScreen extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function press;

  const FlatButtonForProfileScreen({
    Key key,
    this.icon,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: MyColors.disabled,
            size: 30,
          ),
        ),
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.symmetric(horizontal: 5),
            onPressed: press,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: MyColors.secondaryDarkColor,
                      fontSize: 17,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
