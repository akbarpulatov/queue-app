import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/styles.dart';

class FlatInputDecoration extends InputDecoration {
  @override
  final String labelText;
  @override
  final String hintText;

  FlatInputDecoration({
    this.labelText,
    this.hintText,
  }) : super(
          counterText: "",
          hintMaxLines: 3,
          hintStyle: TextStyles.hintStyle,
          labelStyle: TextStyles.labelStyle,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorStyles.dividerColor)),
        );
}
