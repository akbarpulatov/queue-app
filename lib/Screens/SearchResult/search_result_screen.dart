import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/search_result_item.dart';
import 'package:flutter_auth/components/AppBar.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlatAppBar(
        label: '546401',
      ),
      body: SearchResultItem(),
    );
  }
}


