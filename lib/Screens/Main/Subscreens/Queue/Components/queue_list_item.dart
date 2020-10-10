import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/queue.dart';

class QueueListItemView extends StatelessWidget {
  const QueueListItemView({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final String name = queueList[index].name;
    final String createdTime = queueList[index].createdTime;
    final String currentOrder = queueList[index].currentOrder;

    return Container(
      width: DisplaySize.size.width,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//=====================< Row #1 >=======================
          Text(
            name,
            style: Theme.of(context).textTheme.headline5,
            maxLines: 3,
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
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
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
                        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
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
    );
  }
}
