import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/QueueManageScreen/queue_manage_screen.dart';
import 'package:flutter_auth/Screens/SearchResult/search_result_screen.dart';
import 'package:flutter_auth/Screens/WatchScreen/watch_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        textTheme: textTheme(),
        fontFamily: 'SFProDisplay',
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundLightColor,
      ),
      home: QueueManagementScreen(),
      // home: WelcomeScreen(),
    );
  }

  TextTheme textTheme() {
    return TextTheme(
      headline2: TextStyle(
        fontWeight: FontWeight.w700,
        color: Color(0xFF282826),
        fontSize: 21,
      ),
      headline3: TextStyle(
        fontWeight: FontWeight.w700,
        color: Color(0xFF282826),
        fontSize: 17,
      ),
      headline4: TextStyle(
        fontWeight: FontWeight.w700,
        color: Color(0xFF282826),
        fontSize: 33,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w700,
        color: Color(0xFF282826),
        fontSize: 19,
        height: 25 / 19,
        letterSpacing: 0.5,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.w400,
        color: Color(0xFFBDBDB2),
        fontSize: 15,
        height: 18 / 15,
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xFF515142),
        fontSize: 17,
      ),
      caption: TextStyle(
        fontWeight: FontWeight.w700,
        height: 21 / 17,
        color: Color(0xFFBDBDB2),
        fontSize: 17,
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.w400,
        color: Color(0xFF515142),
        fontSize: 13,
      ),
    );
  }
}
