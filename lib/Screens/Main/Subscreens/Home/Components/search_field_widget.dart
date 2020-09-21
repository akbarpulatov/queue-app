import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 80,
        width: double.infinity,
        child: Text('SearchFiledHere'),
        color: MyColors.secondaryLightColor,
      ),
    );
  }
}
