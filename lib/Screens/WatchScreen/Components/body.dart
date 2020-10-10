import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/button_container.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/icon_container.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/styles.dart';
import 'package:flutter_auth/Screens/WatchScreen/Components/qr_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  final size = 26;
  final textWatchButton = 'Наблюдать';
  final textBookButton = 'Занять';
  final idQueue = '546401';

  Widget _buildAlert(context) {
    return AlertDialog(
      content: Container(
        height: 210,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Вы действительно хотите занять очередь?',
              style: Styles.textStyleAlertHeader,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 18),
            Text(
              'Если вы пропустите 5 раз свою очередь, она автоматически закроется',
              style: Styles.textStyleAlertBody,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                ButtonContainer(
                  flex: 1,
                  onPressed: () {
                    print('Cancel is pressed in alert menu');
                    Navigator.of(context).pop();
                  },
                  borderColor: MyColors.disabled,
                  child: Text(
                    'Отмена',
                    style: Styles.textStyleButton,
                  ),
                ),
                SizedBox(width: 20),
                ButtonContainer(
                  flex: 1,
                  onPressed: () {
                    print('Let us book is pressed in alert menu!');
                    Navigator.of(context).pop();
                  },
                  borderColor: MyColors.enabled,
                  fillColor: MyColors.enabled,
                  child: Text(
                    textBookButton,
                    style: Styles.textStyleButton.merge(
                      TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///=====================< Row #1 >=======================
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 3,
            ),
            child: Text(
              'Технический осмотр автомобиля в ГАИ',
              style: Styles.header1,
            ),
          ),

          ///=====================< Row #2 >=======================
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 3,
            ),
            child: Text(
              'Ср. время ожидания: 15 мин.',
              style: TextStyle(
                color: Color(0xFF71B725),
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(height: 20),

          ///=====================< Row #3 >=======================
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconContainer(iconData: LineAwesomeIcons.clock),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Часы работы',
                          style: Styles.dimmedTextStyle,
                        ),
                        Text(
                          '9:00 - 18:00',
                          style: Styles.textStyle1,
                        ),
                        Text(
                          'Обед 13:00-14:00',
                          style: Styles.textStyle2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconContainer(iconData: LineAwesomeIcons.user),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Очередь',
                          style: Styles.dimmedTextStyle,
                        ),
                        Text(
                          '107 чел.',
                          style: Styles.textStyle1,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20),

          ///=====================< Row #4 >=======================
          Row(
            children: [
              IconContainer(iconData: LineAwesomeIcons.info),
              Container(
                width: DisplaySize.size.width - 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Заметка',
                      style: Styles.dimmedTextStyle,
                    ),
                    Text(
                      'При себе необходимо иметь ксерокопию паспорта',
                      style: Styles.textStyle1_1,
                      maxLines: 3,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 18),

          ///=====================< Row #5 >=======================
          Center(
            child: Text(
              'Текущий №',
              style: Styles.textStyle3,
            ),
          ),
          SizedBox(height: 5),

          ///=====================< Row #6 >=======================
          Center(
            child: Text(
              '15',
              style: Styles.textStyle4,
            ),
          ),
          SizedBox(height: 15),

          ///=====================< Row #7 >=======================
          QrContainer(idQueue: idQueue),
        ],
      ),
    );
  }
}