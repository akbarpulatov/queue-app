import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/queue_list_view.dart';
import 'package:flutter_auth/Screens/QueueManageScreen/Components/queue_management_item.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/view_models/queue_view_model.dart';
import 'package:provider/provider.dart';

enum StateOfQueueScreen {
  emptylist,
  showList,
  showQueueInfo,
}

class QueueScreen extends StatefulWidget {
  QueueScreen({Key key}) : super(key: key);

  @override
  QueueScreenState createState() => QueueScreenState();
}

class QueueScreenState extends State<QueueScreen> {
  @override
  Widget build(BuildContext context) {
    final QueueViewModel queueViewModel = Provider.of<QueueViewModel>(context);

    switch (queueViewModel.stateOfQueueScreen) {

      /// Showing the empty list
      case StateOfQueueScreen.emptylist:
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Очередь',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          body: EmptyListView(),
        );
        break;

      /// Showing the queue list
      case StateOfQueueScreen.showList:
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Список очередей',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          body: QueueListView(),
        );
        break;

      /// Showing the queue info
      case StateOfQueueScreen.showQueueInfo:
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              // onPressed: () => Navigator.of(context).pop(),
              onPressed: () {
                queueViewModel.setQueueScreenState =
                    StateOfQueueScreen.showList;
              },
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Очередь',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          body: QueueManagementItem(),
        );
    }
    return SizedBox();
  }
}

class EmptyListView extends StatelessWidget {
  const EmptyListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QueueViewModel queueViewModel = Provider.of<QueueViewModel>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'У вас еще нет \n созданных очередей',
              style: TextStyle(
                  fontSize: 20,
                  // fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: DisplaySize.size.width * 0.6,
            child: Text(
              'Добавьте новую очередь \nс помощью кнопки',
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
