import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Main/main_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This size provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Зарегистрироваться",
              color: kPrimaryColor,
              textColor: kBackgroundLightColor,
              press: () {
                Navigator.pushNamed(context, '/sign-up');
              },
            ),
            RoundedButton(
              text: "Войти без регистрации",
              color: kBackgroundLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
