import 'package:flutter/material.dart';
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

    // final String uID = queueList[index].uID;
    final String name = queueList[index].name;
    final String createdTime = queueList[index].createdTime;
    final String currentOrder = queueList[index].currentOrder;

    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
//=====================< Row #1 >=======================
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  )
                ],
              ),
//=====================< Row #2 >=======================
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
                        Text(createdTime),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Текущий №',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[600]),
                          ),
                          Text(currentOrder),
                        ],
                      ),
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
