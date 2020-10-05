import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/search_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';

class RoundedSearchInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedSearchInputField({
    Key key,
    this.hintText,
    this.icon = Icons.ac_unit_sharp,
    this.onChanged,
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
                suffixIcon: SvgPicture.asset(
                  'assets/icons/arrow_search_field.svg',
                  fit: BoxFit.none,
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
