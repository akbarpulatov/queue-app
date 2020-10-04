import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/TopAppBar.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/booked_queue_item_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/booked_queue_list_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/search_field_widget.dart';
import 'package:flutter_auth/constants.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainScreenTopAppBar(),
      body: Column(
        children: [
          SearchFieldWidget(),
          BookedQueueListView(),
        ],
      ),
    );
  }
}
