import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';
import 'package:flutter_auth/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DisplaySize(context);
    return Scaffold(
      body: Body(),
    );
  }
}
