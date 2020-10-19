import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/rounded_input_field.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/search_field_container.dart';
import 'package:flutter_auth/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedSearchInputField(
      hintText: 'type here',
      icon: Icons.ac_unit,
      onChanged: (value) {
        print(value);
      },
    );
  }
}
