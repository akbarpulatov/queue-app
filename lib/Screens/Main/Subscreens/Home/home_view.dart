import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/TopAppBar.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/booked_queue_item_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/booked_queue_list_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/rounded_input_field.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/search_field_container.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/search_field_widget.dart';
import 'package:flutter_auth/Screens/SearchResult/search_result_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
          RoundedSearchInputField(
            onPressed: () {
              print('find queue button is pressed');
              Navigator.pushNamed(context, '/search-result');
            },
            hintText: 'Ввести код',
            onChanged: (value) {
              print(value);
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Ваши очереди'),
            alignment: Alignment.centerLeft,
          ),
          BookedQueueListView(),
        ],
      ),
    );
  }
}
