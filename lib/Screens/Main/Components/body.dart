import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Components/background.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/History/history_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/home_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Subscreens/create_queue_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/queue_view.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(child: MainPage()),
    );
  }
}

//===========================================< Main Page >===========================================
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final tabs = [
    // Center(child: Text('Здесь будеть Главная страница')),
    HomeView(),
    // Center(child: Text('Здесь будеть страница Очереди')),
    // QueueScreen(),
    CreateQueueScreen(),
    HistoryView(),
    // Center(child: Text('Здесь будеть страница История')),
    Center(child: Text('Здесь будеть страница Профилья')),
  ];

  final botNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Главная'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.queue),
      title: Text('Очередь'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      title: Text('История'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text('Профиль'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[850],
        items: botNavigationBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
