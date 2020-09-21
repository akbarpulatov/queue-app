import 'package:flutter/material.dart';

class QueueItemView extends StatelessWidget {
  const QueueItemView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.lightGreen,
        child: Text('Queue Item View'),
      ),
    );
  }
}
