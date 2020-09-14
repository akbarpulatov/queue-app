import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/queue_list_item.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:flutter_auth/services/http_requests.dart';
import 'package:flutter_auth/model/history.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/History/Components/history_list_item.dart';

class QueueListView extends StatefulWidget {
  final HistoryItemType historyItemType;

  QueueListView({
    Key key,
    @required this.historyItemType,
  }) : super(key: key);

  @override
  _QueueListViewState createState() => _QueueListViewState();
}

class _QueueListViewState extends State<QueueListView> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshList(HistoryItemType historyItemType) async {
    String url;

    if (historyItemType == HistoryItemType.createdList) {
      url = MyUrls.historyCreatedList;
    } else {
      url = MyUrls.historyBookedList;
    }

    // httpRequest.getHttp(url);
    refreshKey.currentState?.show(atTop: false);

    await Future.delayed(Duration(seconds: 2));
    setState(() {
      print('set state is fired!');
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final historyItemType = widget.historyItemType;
    final int length = queueList.length;

    return RefreshIndicator(
      onRefresh: () => refreshList(historyItemType),
      key: refreshKey,
      child: ListView.separated(
          itemCount: length,
          itemBuilder: (context, index) {
            return QueueListItemView(
              index: index,
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}
