import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/button_container.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/icon_container.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/styles.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:flutter_auth/view_models/search_result_view_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    Key key,
  }) : super(key: key);

  static const size = 26;
  static const textWatchButton = 'Наблюдать';
  static const textBookButton = 'Занять';

  Widget _buildAlert(context) {
    final model = Provider.of<SearchResultViewModel>(context, listen: false);

    return AlertDialog(
      content: Container(
        height: 250,
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
//=================< Cancel Button >=================
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

//=================< Book Approve Button >=================
                ButtonContainer(
                  flex: 1,
                  onPressed: () {
                    //TODO: add change provider notifier
                    model.addQueue();
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
//=====================< Row #1 >=======================
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

//=====================< Row #2 >=======================
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

//=====================< Row #3 >=======================
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

//=====================< Row #4 >=======================
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

//=====================< Row #5 >=======================
          Center(
            child: Text(
              'Текущий №',
              style: Styles.textStyle3,
            ),
          ),
          SizedBox(height: 5),

//=====================< Row #6 >=======================
          Center(
            child: Text(
              '$currentQueue',
              style: Styles.textStyle4,
            ),
          ),
          SizedBox(height: 15),

//=====================< Row #7 >=======================
          Row(
            children: [
              SizedBox(width: 16),
              ButtonContainer(
                flex: 1,
                onPressed: () {
                  Navigator.pushNamed(context, '/watch');
                },
                borderColor: MyColors.disabled,
                child: Text(
                  textWatchButton,
                  style: Styles.textStyleButton,
                ),
              ),
              SizedBox(width: 19),

//=================< Let's Book Button >=================
              ButtonContainer(
                flex: 1,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => _buildAlert(context),
                  );
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
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}
