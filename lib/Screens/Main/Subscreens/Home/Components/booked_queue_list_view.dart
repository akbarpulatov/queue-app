import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/booked_queue_item_view.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/booked_queue.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:flutter_auth/services/http_requests.dart';

class BookedQueueListView extends StatefulWidget {
  BookedQueueListView({
    Key key,
  }) : super(key: key);

  @override
  _BookedQueueListViewState createState() => _BookedQueueListViewState();
}

class _BookedQueueListViewState extends State<BookedQueueListView> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshList() async {
    final url = MyUrls.bookedQueueList;

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
    final int length = bookedQueueList.length;

    return Expanded(
      child: RefreshIndicator(
        onRefresh: refreshList,
        key: refreshKey,
        child: ListView.separated(
            itemCount: length,
            itemBuilder: (context, index) {
              return BookedQueueItemView(
                index: index,
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            }),
      ),
    );
  }
}
