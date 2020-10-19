import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Profile/Components/flat_button_for_profile_screen.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Profile/Components/user_profile_info.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/button_container.dart';
import 'package:flutter_auth/components/AppBar.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/user.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlatAppBar(
        label: 'Личный кабинет',
      ),
      body: Column(
        children: [
          UserProfileInfo(),
          SizedBox(height: 20),
          User.type == UserType.user
              ? Column(
                  children: [
                    SizedBox(
                      width: DisplaySize.size.width * 0.8,
                      child: ButtonContainer(
                        onPressed: () {},
                        borderColor: Color(0xFFB5B5AD),
                        child: Text('Сменить тариф',
                            style: Theme.of(context).textTheme.button),
                      ),
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
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: DisplaySize.size.height * 0.1,
                    ),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.pushNamed(context, '/sign-up');
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ],
                ),
          Expanded(child: SizedBox()),
          if (User.type == UserType.user)
            RoundedButton(
              text: "Выход",
              color: kBackgroundLightColor,
              borderColor: MyColors.redLight,
              textColor: MyColors.redDark,
              press: () {
                // Sign-out
              },
            ),
          // : Column(
          //     children: [
          //       RoundedButton(
          //         text: "Войти",
          //         color: kBackgroundLightColor,
          //         borderColor: kPrimaryColor,
          //         textColor: kPrimaryColor,
          //         press: () {
          //           //Sign-up
          //           Navigator.pushNamed(context, '/login');
          //         },
          //       ),
          //       RoundedButton(
          //         text: "Зарегистрироваться",
          //         color: kBackgroundLightColor,
          //         borderColor: kPrimaryColor,
          //         textColor: kPrimaryColor,
          //         press: () {
          //           //Sign-up
          //           Navigator.pushNamed(context, '/sign-up');
          //         },
          //       ),
          //     ],
          //   ),
          SizedBox(
            height: 7,
          ),
        ],
      ),
    );
  }
}
