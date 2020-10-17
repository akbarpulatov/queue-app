import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/QueueManageScreen/queue_manage_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:intl/intl.dart';

class QueueListItemView extends StatelessWidget {
  const QueueListItemView({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final name = Navbat.queueList[index].name;
    final _dateCreatedDate = Navbat.queueList[index].dateCreated;
    final _dateCreatedTimeOfDay = Navbat.queueList[index].workingTimeBegin;

    final _createdTime = DateTime(
      _dateCreatedDate.year,
      _dateCreatedDate.month,
      _dateCreatedDate.day,
      _dateCreatedTimeOfDay.hour,
      _dateCreatedTimeOfDay.minute,
    );

    final createdTime = DateFormat('d.MM.yyyy  H:mm').format(_createdTime);
    final currentOrder = Navbat.queueList[index].currentQueue;

    return Container(
      width: DisplaySize.size.width,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
//=====================< Row #1 >=======================
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline5,
                  maxLines: 3,
                ),
                SizedBox(height: 15),
//=====================< Row #2 >=======================
                Row(
                  children: [
                    Icon(
                      LineAwesomeIcons.calendar_plus,
                      color: Color(0xFFDEDED5),
                      size: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Дата создания',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            createdTime,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Текущий №',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            '$currentOrder',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 5),
          FlatButton(
            minWidth: 0,
            padding: EdgeInsets.all(0),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Icon(
              LineAwesomeIcons.angle_right,
            ),
            onPressed: () {
              print('Queue info button is pressed');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return QueueManagementScreen(index: index);
              }));
              // currentOrderViewModel.onFocus = index;
            },
          )
        ],
      ),
    );
  }
}
