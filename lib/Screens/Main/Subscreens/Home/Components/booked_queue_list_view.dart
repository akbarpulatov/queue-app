import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/booked_queue_item_view.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/booked_queue.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:flutter_auth/services/http_requests.dart';
import 'package:flutter_auth/view_models/search_result_view_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
    final width = MediaQuery.of(context).size.width;
    final searchResultModel = Provider.of<SearchResultViewModel>(context);

    return Expanded(
      child: bookedQueueList.isNotEmpty
          ? RefreshIndicator(
              onRefresh: refreshList,
              key: refreshKey,
              child: ListView.separated(
                  itemCount: Navbat.bookedQueueList.length,
                  itemBuilder: (context, index) {
                    return BookedQueueItemView(
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  }),
            )
          : Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 10,
                      child: SizedBox(),
                    ),
                    Container(
                      width: width * 0.5,
                      child: Text(
                        'У вас еще нет записей в очередь',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: width * 0.5,
                      child: Text(
                        'Добавьте очередь через код или отсканируйте QR',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 19,
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Color(0xFFFAC232),
                onPressed: () {
                  print('Help button from home screen is tapped');
                },
                child: SvgPicture.asset('assets/icons/question_mark.svg'),
              ),
            ),
    );
  }
}
