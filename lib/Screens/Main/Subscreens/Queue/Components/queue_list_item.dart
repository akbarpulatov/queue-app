import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/queue_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:flutter_auth/view_models/queue_view_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class QueueListItemView extends StatelessWidget {
  const QueueListItemView({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final QueueViewModel queueViewModel = Provider.of<QueueViewModel>(context);
    final String name = queueList[index].name;
    final String createdTime = queueList[index].createdTime;
    final String currentOrder = queueList[index].currentOrder;

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
                            currentOrder,
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
              // TODO: change the state enum of queuescreen and call setstate method of it
              queueViewModel.setQueueScreenState =
                  StateOfQueueScreen.showQueueInfo;
            },
          )
        ],
      ),
    );
  }
}
