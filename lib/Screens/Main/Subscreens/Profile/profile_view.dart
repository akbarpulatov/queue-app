import 'package:flutter/material.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('Личный кабинет'),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              LineAwesomeIcons.user,
              size: 30,
              color: MyColors.disabled,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login'),
                  Text('John'),
                  Divider(
                    indent: 0,
                    height: 20,
                    endIndent: 0,
                  ),
                  Text('Tarif: Free'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
