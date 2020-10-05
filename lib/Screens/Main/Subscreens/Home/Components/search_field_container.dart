import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class SearchFieldContainer extends StatelessWidget {
  final Widget child;
  const SearchFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
