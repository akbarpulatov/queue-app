import 'package:flutter/material.dart';
import 'package:flutter_auth/model/history.dart';
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
      httpRequest.getHttp();
      final createdItem = CreatedItem();

      createdItem.uID = '18';
      createdItem.status = 'Na Priyome';
      createdItem.name = 'new Clinics';
      createdItem.averageWaitingTime = '15 min';
      createdItem.bookedTime = '13 min';
      createdItem.numberOfPeopleInQueue = '20';

      createdList.add(createdItem);

      //TODO: Delete it. Cause it is for testing data model.
      history.updateCreatedList('jsonRaw');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Очередь',
            style: TextStyle(color: Colors.black),
          ),
        ),
        //TODO: body will be changed according to
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'У вас еще нет созданных очередей',
                  style: TextStyle(
                      fontSize: 20,
                      // fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Добавьте новую очередь с помощью кнопки',
                style: TextStyle(
                  fontSize: 14,
                  // fontStyle: FontStyle.italic,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          child: FloatingActionButton(
            onPressed: _onPressedAddQueue,
            child: Icon(Icons.add),
            // child: Text('Создать'),
          ),
        ),
      ),
    );
  }
}
