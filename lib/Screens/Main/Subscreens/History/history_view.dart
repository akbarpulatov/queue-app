import 'package:flutter/material.dart';
import 'Components/history_list_item.dart';
import 'Components/history_list_view.dart';

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
          HistoryListView(
            historyItemType: HistoryItemType.bookedList,
          ),
          HistoryListView(
            historyItemType: HistoryItemType.createdList,
          ),
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
