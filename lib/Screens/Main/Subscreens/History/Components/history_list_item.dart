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
  final List<CreatedItem> listCreatedItems;
  final HistoryItemType historyItemType;

  const HistoryItem({
    Key key,
    @required this.index,
    @required this.listCreatedItems,
    @required this.historyItemType,
  }) : super(key: key);

  @override
  _HistoryItemState createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    // final String name = widget.listCreatedItems[widget.index].name;

    // Common parameters
    // Booked List parameters

    // Created List parameters
    final String uID = widget.listCreatedItems[widget.index].uID;
    final String status = widget.listCreatedItems[widget.index].status;
    final String name = widget.listCreatedItems[widget.index].name;
    final String averageWaitingTime =
        widget.listCreatedItems[widget.index].averageWaitingTime;
    final String bookedTime = widget.listCreatedItems[widget.index].bookedTime;
    final String numberOfPeopleInQueue =
        widget.listCreatedItems[widget.index].numberOfPeopleInQueue;

    final historyItemType = widget.historyItemType;

    var icon = Icon(Icons.ac_unit);
    Color colorStatus = MyColors.enabled;
    var iconSrc = MyAssets.check;

    switch (status) {
      case 'Завершено':
        icon = Icon(Icons.check_circle_outline);
        colorStatus = MyColors.disabled;
        iconSrc = MyAssets.check;
        break;
      case 'Закрыто':
        icon = Icon(Icons.cancel);
        colorStatus = MyColors.disabled;
        iconSrc = MyAssets.cancel;
        break;
      case 'Открыто':
        icon = Icon(Icons.arrow_forward);
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
                    // child: icon,
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

                  // TODO this Row should be conditional of historyItemType
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
        // color: Colors.grey[500],
        // width: 500,
        // height: 150,
      ),
    );
  }
}
