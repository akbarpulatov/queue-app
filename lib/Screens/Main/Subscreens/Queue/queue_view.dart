import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/queue_list_view.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Subscreens/create_queue_view.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/queue.dart';
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
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CreateQueueScreen();
      }));
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
      body: queueList.length == 0
          ? Center(
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
            )
          : QueueListView(),
      floatingActionButton: Container(
        child: FloatingActionButton(
          backgroundColor: MyColors.enabled,
          onPressed: _onPressedAddQueue,
          child: Icon(Icons.add),
          // child: Text('Создать'),
        ),
      ),
    );
  }
}
