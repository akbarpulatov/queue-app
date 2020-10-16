import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/empty_list_body.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/queue_list_view.dart';
import 'package:flutter_auth/Screens/QueueManageScreen/Components/queue_management_item.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:flutter_auth/view_models/create_new_queue_view_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class QueueScreen extends StatefulWidget {
  QueueScreen({Key key}) : super(key: key);

  @override
  QueueScreenState createState() => QueueScreenState();
}

class QueueScreenState extends State<QueueScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: queueList.length == 0 ? EmptyListView() : QueueListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.enabled,
        child: Icon(LineAwesomeIcons.plus),
        onPressed: () {
          Navigator.pushNamed(context, '/create-queue');
        },
      ),
    );
  }
}
