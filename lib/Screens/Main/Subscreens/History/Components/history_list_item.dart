import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth/model/history.dart';

enum HistoryItemType {
  createdList,
  bookedList,
}

//==========================================================
class HistoryItem extends StatefulWidget {
  final int index;
  // final List<CreatedItem> listCreatedItems;
  final HistoryItemType historyItemType;

  const HistoryItem({
    Key key,
    @required this.index,
    // @required this.listCreatedItems,
    @required this.historyItemType,
  }) : super(key: key);

  @override
  _HistoryItemState createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    final historyItemType = widget.historyItemType;
    final index = widget.index;
    // final String uID = createdList[widget.index].uID;

    // Common parameters
    String status;
    String name;
    String averageWaitingTime;
    String bookedTime;

    if (historyItemType == HistoryItemType.createdList) {
      status = createdList[index].status;
      name = createdList[index].name;
      averageWaitingTime = createdList[index].averageWaitingTime;
      bookedTime = createdList[index].bookedTime;
    } else {
      status = bookedList[index].status;
      name = bookedList[index].name;
      averageWaitingTime = bookedList[index].averageWaitingTime;
      bookedTime = bookedList[index].bookedTime;
    }

    // Created List parameters
    String numberOfPeopleInQueue;
    if (historyItemType == HistoryItemType.createdList)
      numberOfPeopleInQueue = createdList[index].numberOfPeopleInQueue;

    // Booked List parameters
    String orderInQueue;
    if (historyItemType == HistoryItemType.bookedList) {
      orderInQueue = bookedList[index].orderInQueue;
    }

    Color colorStatus = MyColors.enabled;
    var iconSrc = MyAssets.check;

    switch (status) {
      case 'Завершено':
        colorStatus = MyColors.disabled;
        iconSrc = MyAssets.check;
        break;
      case 'Закрыто':
        colorStatus = MyColors.disabled;
        iconSrc = MyAssets.cancel;
        break;
      case 'Открыто':
        colorStatus = MyColors.enabled;
        iconSrc = MyAssets.rightArrow;
        break;

      default:
    }

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
                    status,
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
                          'Дата создания',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                        Text(bookedTime),
                      ],
                    ),
                  ),
                  if (historyItemType == HistoryItemType.createdList)
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
      ),
    );
  }
}
