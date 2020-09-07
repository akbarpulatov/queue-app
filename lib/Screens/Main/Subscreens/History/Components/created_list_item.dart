import 'package:flutter/material.dart';
import 'package:flutter_auth/model/history.dart';

//==========================================================
class CreatedHistoryItem extends StatefulWidget {
  final int index;
  final List<CreatedItem> listCreatedItems;

  const CreatedHistoryItem({
    Key key,
    @required this.index,
    @required this.listCreatedItems,
  }) : super(key: key);

  @override
  _CreatedHistoryItemState createState() => _CreatedHistoryItemState();
}

class _CreatedHistoryItemState extends State<CreatedHistoryItem> {
  @override
  Widget build(BuildContext context) {
    // final String name = widget.listCreatedItems[widget.index].name;

    final String uID = widget.listCreatedItems[widget.index].uID;
    final String status = widget.listCreatedItems[widget.index].status;
    final String name = widget.listCreatedItems[widget.index].name;
    final String averageWaitingTime =
        widget.listCreatedItems[widget.index].averageWaitingTime;
    final String bookedTime = widget.listCreatedItems[widget.index].bookedTime;
    final String numberOfPeopleInQueue =
        widget.listCreatedItems[widget.index].numberOfPeopleInQueue;

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
                    child: Icon(
                      Icons.assignment_turned_in,
                      color: Colors.lightGreen,
                    ),
                  ),
                  Text(
                    status,
                    style: TextStyle(color: Colors.lightGreen, fontSize: 17),
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
                            'Среднее ожидание: $averageWaitingTime.',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                          'Вы в очереди с',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                        Text(bookedTime),
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
                          Text('$numberOfPeopleInQueue чел.'),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        // color: Colors.grey[500],
        // width: 500,
        // height: 150,
      ),
    );
  }
}
