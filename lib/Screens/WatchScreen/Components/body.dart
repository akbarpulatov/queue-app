import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/icon_container.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/styles.dart';
import 'package:flutter_auth/Screens/WatchScreen/Components/qr_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  static const size = 26;

  @override
  Widget build(BuildContext context) {
    final idQueue = Navbat.searchResult.uID;

    final name = Navbat.searchResult.name;
    final averageWaitingTime = Navbat.searchResult.averageWaitingTime.inMinutes;

    final workingTimeBegin =
        Navbat.searchResult.workingTimeBegin.format(context);
    final workingTimeEnd = Navbat.searchResult.workingTimeEnd.format(context);
    final workingTime = '$workingTimeBegin - $workingTimeEnd';

    final breakTimeBegin = Navbat.searchResult.breakTimeBegin.format(context);
    final breakTimeEnd = Navbat.searchResult.breakTimeEnd.format(context);
    final breakTime = '$breakTimeBegin-$breakTimeEnd';

    final totalQueue = Navbat.searchResult.totalQueue;
    final note = Navbat.searchResult.note;
    final currentQueue = Navbat.searchResult.currentQueue;

    return SingleChildScrollView(
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
              name,
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
              'Ср. время ожидания: $averageWaitingTime мин.',
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
                          workingTime,
                          style: Styles.textStyle1,
                        ),
                        Text(
                          'Обед $breakTime',
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
                          '$totalQueue чел.',
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
                      note,
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
              '$currentQueue',
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
