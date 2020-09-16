import 'package:flutter/material.dart';
import 'package:flutter_auth/components/flat_text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class SquaredInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const SquaredInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatTextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: MyColors.secondaryColor,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.secondaryLightColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.secondaryColor),
          ),
          // icon: Icon(
          //   icon,
          //   color: kPrimaryColor,
          // ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
