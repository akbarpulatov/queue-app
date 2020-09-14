import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/History/Components/history_list_item.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/history.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QueueListItemView extends StatefulWidget {
  final int index;

  const QueueListItemView({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  _QueueListItemViewState createState() => _QueueListItemViewState();
}

class _QueueListItemViewState extends State<QueueListItemView> {
  @override
  Widget build(BuildContext context) {
    final index = widget.index;

    final String uID = queueList[index].uID;
    final String name = queueList[index].name;
    final String createdTime = queueList[index].createdTime;
    final String currentOrder = queueList[index].currentOrder;

    Color colorStatus = MyColors.enabled;
    var iconSrc = MyAssets.check;

    colorStatus = MyColors.disabled;
    iconSrc = MyAssets.check;

    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
//=====================< Row #1 >=======================
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      iconSrc,
                      color: colorStatus,
                      height: 26,
                      width: 26,
                    ),
                  ),
                  Text(
                    'status',
                    style: TextStyle(color: colorStatus, fontSize: 17),
                  )
                ],
              ),
//=====================< Row #2 >=======================
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
                            'Среднее ожидание: averageWaitingTime.',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[700]),
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
                      border: Border.all(
                          color: Colors.green, style: BorderStyle.solid),
                    ),
                    child: Column(
                      children: [
                        Text('Ваш №'),
                        Text(
                          'orderInQueue',
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
//=====================< Row #3 >=======================
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.check_circle_outline),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Дата создания',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                        Text('bookedTime'),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.supervised_user_circle),
                      ),
                      Column(
                        children: [
                          Text(
                            'Очередь',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[600]),
                          ),
                          Text('numberOfPeopleInQueue чел.'),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
