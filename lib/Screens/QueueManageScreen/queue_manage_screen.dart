import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/QueueManageScreen/Components/queue_management_item.dart';
import 'package:flutter_auth/components/AppBar.dart';

class QueueManagementScreen extends StatelessWidget {
  const QueueManagementScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlatAppBar(label: 'Очередь'),
      body: QueueManagementItem(),
    );
  }
}
