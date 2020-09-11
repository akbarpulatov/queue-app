import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/services/http_requests.dart';
import 'package:flutter_auth/model/history.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/History/Components/history_list_item.dart';

class HistoryListView extends StatefulWidget {
  final HistoryItemType historyItemType;

  HistoryListView({
    Key key,
    @required this.historyItemType,
  }) : super(key: key);

  @override
  _HistoryListViewState createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshList(HistoryItemType historyItemType) async {
    var url = MyUrls.historyBookedList;

    if (historyItemType == HistoryItemType.createdList) {
      url = MyUrls.historyCreatedList;
    } else {
      url = MyUrls.historyBookedList;
    }

    httpRequest.getHttp(url);
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

    return RefreshIndicator(
      onRefresh: () => refreshList(historyItemType),
      key: refreshKey,
      child: ListView.separated(
        itemCount: createdList.length,
        itemBuilder: (context, index) {
          return HistoryItem(
            index: index,
            listCreatedItems: createdList,
            historyItemType: historyItemType,
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
