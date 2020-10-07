import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Profile/Components/flat_button_for_profile_screen.dart';
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
                  Divider(),
                  Text('Tarif: Free'),
                ],
              ),
            ),
          ],
        ),
        RoundedButton(
          text: "Сменить тариф",
          color: kBackgroundLightColor,
          borderColor: MyColors.disabled,
          textColor: Colors.black,
          press: () {
            print('Button pressed: Сменить тариф');
          },
        ),
        SizedBox(
          height: 30,
        ),
        Divider(),
        FlatButtonForProfileScreen(
          icon: LineAwesomeIcons.history,
          text: 'История очередей',
          press: () {
            print('История очередей');
          },
        ),
        Divider(
          indent: 50,
        ),
        FlatButtonForProfileScreen(
          icon: LineAwesomeIcons.lock,
          text: 'Сменить пароль',
          press: () {
            print('Сменить пароль');
          },
        ),
        Divider(),
        Expanded(child: SizedBox()),
        RoundedButton(
          text: "Выход",
          color: kBackgroundLightColor,
          borderColor: MyColors.redLight,
          textColor: MyColors.redDark,
          press: () {
            print('Выход');
          },
        ),
        SizedBox(
          height: 7,
        ),
      ],
    );
  }
}
