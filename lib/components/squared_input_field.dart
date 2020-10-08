import 'package:flutter/material.dart';
import 'package:flutter_auth/components/flat_text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class SquaredInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;

  const SquaredInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatTextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: MyColors.secondaryColor,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.secondaryColor),
          ),
          hintText: hintText,
          hintStyle: MyStyles.dimmedText,
          hintMaxLines: 3,
          border: InputBorder.none,
        ),
        keyboardType: keyboardType ?? TextInputType.name,
      ),
    );
  }
}
