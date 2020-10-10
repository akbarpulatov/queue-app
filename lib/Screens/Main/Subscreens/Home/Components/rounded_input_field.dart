import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/search_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';

class RoundedSearchInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function onPressed;

  const RoundedSearchInputField({
    Key key,
    this.hintText,
    this.icon = Icons.ac_unit_sharp,
    this.onChanged,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SearchFieldContainer(
          child: Expanded(
            child: TextField(
              onChanged: onChanged,
              cursorColor: MyColors.disabled,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                suffixIcon: FlatButton(
                  minWidth: 30,
                  padding: EdgeInsets.all(0),
                  onPressed: onPressed,
                  child: SvgPicture.asset(
                    'assets/icons/arrow_search_field.svg',
                    height: 26,
                  ),
                ),
              ),
            ),
          ),
        ),
        SvgPicture.asset('assets/icons/qr.svg')
      ],
    );
  }
}
