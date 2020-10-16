import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class EmptyListView extends StatelessWidget {
  const EmptyListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'У вас еще нет \n созданных очередей',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
