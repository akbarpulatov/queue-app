import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/booked_queue.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookedQueueItemView extends StatefulWidget {
  @required
  final int index;
  const BookedQueueItemView({Key key, this.index}) : super(key: key);

  @override
  _BookedQueueItemViewState createState() => _BookedQueueItemViewState();
}

class _BookedQueueItemViewState extends State<BookedQueueItemView> {
  Widget build(BuildContext context) {
    final index = widget.index;

    final String uID = bookedQueueList[index].uID;
    final String name = bookedQueueList[index].name;
    final String createdTime = bookedQueueList[index].createdTime;
    final String order = bookedQueueList[index].order;
    final String averageWaitingTime = bookedQueueList[index].averageWaitingTime;
    final String currentOrder = bookedQueueList[index].currentOrder;
    final String note = bookedQueueList[index].note;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
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
                      order,
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
          // Container(child: Text('Среднее ожидание: $averageWaitingTime.')),
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
                      'Вы в очереди с',
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    ),
                    Text('$createdTime'),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Текущий №',
                        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                      ),
                      Text('$currentOrder'),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
