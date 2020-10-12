import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Subscreens/create_queue_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/queue_screen.dart';
import 'package:flutter_auth/Screens/Main/main_screen.dart';
import 'package:flutter_auth/Screens/QueueManageScreen/queue_manage_screen.dart';
import 'package:flutter_auth/Screens/SearchResult/search_result_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/WatchScreen/watch_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/view_models/queue_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<QueueViewModel>.value(value: QueueViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navbat',
        theme: ThemeData(
          textTheme: textTheme(),
          fontFamily: 'SFProDisplay',
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundLightColor,
        ),
        // initialRoute: '/welcome',
        routes: {
          '/': (context) => MainScreen(),
          '/welcome': (context) => WelcomeScreen(),
          '/login': (context) => LoginScreen(),
          '/sign-up': (context) => SignUpScreen(),
          '/queue-screen': (context) => QueueScreen(),
          '/queue-management': (context) => QueueManagementScreen(),
          '/create-queue': (context) => CreateQueueScreen(),
          '/search-result': (context) => SearchResultScreen(),
          '/watch': (context) => WatchScreen(),
        },
      ),
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
        height: 21 / 17,
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
      button: TextStyle(
        fontWeight: FontWeight.w700,
        color: Color(0xFF282826),
        fontSize: 17,
      ),
    );
  }
}
