import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            height: size.height * 0.5,
            child: SvgPicture.asset(
              "assets/images/main_bottom2.svg",
              fit: BoxFit.fill,
              color: kBackgroundColor,
            ),
          ),
          Positioned(
            bottom: size.height * 0.5,
            width: size.width * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Добро пожаловать!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.103,
                  ),
                ),
                Text(
                  "Navbat",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.20,
                  ),
                ),
                Text(
                  "Kutmang!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.075,
                  ),
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
