import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Components/background.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/History/history_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/home_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Profile/profile_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/queue_screen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(child: MainPage()),
    );
  }
}

int selectedIndexBottomBar = 0;

//===========================================< Main Page >===========================================
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _onItemTapped(int index) {
    setState(() {
      selectedIndexBottomBar = index;
    });
  }

  final tabs = [
    // Center(child: Text('Здесь будеть Главная страница')),
    HomeView(),
    // Center(child: Text('Здесь будеть страница Очереди')),
    QueueScreen(),
    // CreateQueueScreen(),
    HistoryView(),
    // Center(child: Text('Здесь будеть страница История')),
    // ProfileViewScreen(),
    ProfileViewScreen(),
  ];

  final botNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(LineAwesomeIcons.home),
      label: 'Главная',
    ),
    BottomNavigationBarItem(
      icon: Icon(LineAwesomeIcons.calendar_plus),
      label: 'Очередь',
    ),
    BottomNavigationBarItem(
      icon: Icon(LineAwesomeIcons.history),
      label: 'История',
    ),
    BottomNavigationBarItem(
      icon: Icon(LineAwesomeIcons.user),
      label: 'Профиль',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndexBottomBar],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[850],
        items: botNavigationBarItems,
        currentIndex: selectedIndexBottomBar,
        onTap: _onItemTapped,
      ),
    );
  }
}
