import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/search_result_item.dart';
import 'package:flutter_auth/Screens/WatchScreen/Components/body.dart';
import 'package:flutter_auth/components/AppBar.dart';
import 'package:flutter_auth/constants.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DisplaySize(context);

    return Scaffold(
      appBar: FlatAppBar(
        label: 'Наблюдение',
      ),
      body: Body(),
    );
  }
}
