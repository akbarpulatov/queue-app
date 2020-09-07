import 'package:flutter/material.dart';
import 'package:flutter_auth/model/history.dart';

//==========================================================
class BookedQueueItem extends StatefulWidget {
  @override
  _BookedQueueItemState createState() => _BookedQueueItemState();
}

class _BookedQueueItemState extends State<BookedQueueItem> {
  @override
  Widget build(BuildContext context) {
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
                    'На приеме',
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
                            'history.testString',
                            style: TextStyle(fontSize: 19),
                          ),
                          Text(
                            'Среднее ожидание: 5 мин.',
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
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Text('Ваш №'),
                        Text(
                          '1',
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
                  Column(
                    children: [
                      Text(
                        'Вы в очереди с',
                        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                      ),
                      Text('10.07.2020 17:35'),
                    ],
                  ),
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