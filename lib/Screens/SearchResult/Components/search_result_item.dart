import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/button_container.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/icon_container.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/styles.dart';
import 'package:flutter_auth/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    Key key,
  }) : super(key: key);

  final size = 26;
  final textWatchButton = 'Наблюдать';
  final textBookButton = 'Занять';

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
              style: TextStyle(fontSize: 19),
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
          Row(
            children: [
              SizedBox(width: 16),
              ButtonContainer(
                flex: 1,
                onPressed: () {},
                borderColor: MyColors.disabled,
                child: Text(
                  textWatchButton,
                  style: Styles.textStyleButton,
                ),
              ),
              SizedBox(width: 19),
              ButtonContainer(
                flex: 1,
                onPressed: () {},
                borderColor: MyColors.enabled,
                fillColor: MyColors.enabled,
                child: Text(
                  textBookButton,
                  style: Styles.textStyleButton.merge(
                    TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}
