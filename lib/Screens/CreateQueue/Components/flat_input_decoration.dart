import 'package:flutter/material.dart';

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
        );
}
