import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/styles.dart';
import 'package:flutter_auth/components/button_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:flutter_auth/view_models/home_screen_view_model.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BookedQueueItemView extends StatelessWidget {
  const BookedQueueItemView({Key key, this.index}) : super(key: key);
  final int index;

  Widget _buildAlert(context) {
    final homeModel = Provider.of<HomeScreenViewModel>(context);

    return AlertDialog(
      content: Container(
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Вы действительно хотите выйти из очереди?',
              style: Styles.textStyleAlertHeader,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
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

//=================< Delete Approve Button >=================
                ButtonContainer(
                  flex: 1,
                  onPressed: () {
                    homeModel.delete(index);
                    Navigator.of(context).pop();
                  },
                  borderColor: MyColors.enabled,
                  fillColor: MyColors.enabled,
                  child: Text(
                    'Выйти',
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

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final String uID = Navbat.bookedQueueList[index].uID;
    final String name = Navbat.bookedQueueList[index].name;
    final averageWaitingTime =
        '${Navbat.bookedQueueList[index].averageWaitingTime.inMinutes} min';
    final bookedTime = DateFormat('d.MM.yyyy  H:mm')
        .format(Navbat.bookedQueueList[index].bookedTime);
    final myQueue = Navbat.bookedQueueList[index].myQueue;
    final currentQueue = Navbat.bookedQueueList[index].currentQueue;
    final note = Navbat.bookedQueueList[index].note;

    final String exitText = 'Выйти';
    final String shareText = 'Поделиться';

    final SizedBox sizedBox = SizedBox(width: 7);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
//=====================< Row #1 >=======================
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 19),
                      ),
                      Text(
                        'Среднее ожидание: $averageWaitingTime.',
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border:
                      Border.all(color: Colors.green, style: BorderStyle.solid),
                ),
                child: Column(
                  children: [
                    Text('Ваш №'),
                    Text(
                      '$myQueue',
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
//=====================< Row #2 >=======================
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  LineAwesomeIcons.calendar_check,
                  size: 30.0,
                  color: MyColors.disabled,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Вы в очереди с',
                      style: TextStyle(fontSize: 15, color: MyColors.disabled),
                    ),
                    Text('$bookedTime'),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Текущий №',
                        style:
                            TextStyle(fontSize: 15, color: MyColors.disabled),
                      ),
                      Text('$currentQueue'),
                    ],
                  )
                ],
              )
            ],
          ),
//=====================< Row #3 >=======================
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(LineAwesomeIcons.info),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Заметка',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: MyColors.disabled),
                    ),
                    Container(
                      child: Text(note),
                      width: width * 0.8,
                    ),
                  ],
                )
              ],
            ),
          ),
//=====================< Row #4 >=======================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonContainer(
                flex: exitText.length + 9,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => _buildAlert(context),
                  );
                },
                borderColor: Color(0xFFE0503D),
                fillColor: Color(0xFFE0503D),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      LineAwesomeIcons.door_open,
                      color: Colors.white,
                    ),
                    sizedBox,
                    Text(
                      exitText,
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .merge(TextStyle(color: Color(0xFFFFFFFF))),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
              ButtonContainer(
                flex: shareText.length + 9,
                onPressed: () {},
                borderColor: Color(0xFFADADA5),
                fillColor: Color(0xFFADADA5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      LineAwesomeIcons.share,
                      color: Colors.white,
                    ),
                    sizedBox,
                    Text(
                      shareText,
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .merge(TextStyle(color: Color(0xFFFFFFFF))),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
