import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/queue_list_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Subscreens/create_queue_view.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/services/http_requests.dart';

class QueueScreen extends StatefulWidget {
  QueueScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _QueueScreenState createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  void _onPressedAddQueue() {
    setState(() {
      //TODO: Implement what will happen after pressing add queue button
      print('Add Queue button pressed');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Очередь',
          style: TextStyle(color: Colors.black),
        ),
      ),
      //TODO: body will be changed according to queuelist items count
      body: QueueListView(),

      // body: Column(
      //   // mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      // TODO: queue list item view should be implemented

      // Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: Text(
      //     'У вас еще нет созданных очередей',
      //     style: TextStyle(
      //         fontSize: 20,
      //         // fontStyle: FontStyle.italic,
      //         fontWeight: FontWeight.bold),
      //     textAlign: TextAlign.center,
      //   ),
      // ),
      // Text(
      //   'Добавьте новую очередь с помощью кнопки',
      //   style: TextStyle(
      //     fontSize: 14,
      //     // fontStyle: FontStyle.italic,
      //     // fontWeight: FontWeight.bold,
      //   ),
      // ),
      //   ],
      // ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: _onPressedAddQueue,
          child: Icon(Icons.add),
          // child: Text('Создать'),
        ),
      ),
    );
  }
}
