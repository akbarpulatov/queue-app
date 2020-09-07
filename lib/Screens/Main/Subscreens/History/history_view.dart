import 'package:flutter/material.dart';
import 'package:flutter_auth/model/history.dart';
import 'package:flutter_auth/services/http_requests.dart';

import 'Components/booked_list_item.dart';
import 'Components/created_list_item.dart';

//===========================================< MyTabbedPage >===========================================
class HistoryView extends StatefulWidget {
  const HistoryView({Key key}) : super(key: key);
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Занятые',
    ),
    Tab(
      text: 'Созданные',
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Main Return Method
    return Scaffold(
      appBar: HistoryAppBar(
        tabController: _tabController,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MyListView(),
          HistoryListView(),
        ],
      ),
    );
  }
}

class HistoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  HistoryAppBar({
    Key key,
    this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'История',
        style: TextStyle(color: Colors.black),
      ),
      bottom: TabBar(
        controller: tabController,
        tabs: [
          Tab(
            text: 'Занятые',
          ),
          Tab(
            text: 'Созданные',
          ),
        ],
        unselectedLabelColor: Colors.grey[600],
        indicatorColor: Colors.transparent,
        labelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
    );
  }
}

//==========================================================
class HistoryListView extends StatefulWidget {
  @override
  _HistoryListViewState createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshList() async {
    httpRequest.getHttp();
    refreshKey.currentState?.show(atTop: false);

    await Future.delayed(Duration(seconds: 2));
    setState(() {
      print('set state is fired!');
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshList,
      key: refreshKey,
      child: ListView.separated(
        itemCount: createdList.length,
        itemBuilder: (context, index) {
          return CreatedHistoryItem(
            index: index,
            // listCreated: history.createdList,
            listCreatedItems: createdList,
          );
          // return Text('abcd');
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}

//==========================================================
class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return BookedQueueItem();
        // return Text('asdf');
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
