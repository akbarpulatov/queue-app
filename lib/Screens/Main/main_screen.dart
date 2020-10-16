import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Components/body.dart';
import 'package:flutter_auth/constants.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DisplaySize(context);

    return Scaffold(
      body: Body(),
    );
  }
}
