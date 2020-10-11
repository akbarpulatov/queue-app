import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/flat_button.dart';
import 'package:flutter_auth/Screens/QueueManageScreen/Components/queue_management_item.dart';
import 'package:flutter_auth/components/AppBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class QueueManagementScreen extends StatelessWidget {
  const QueueManagementScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlatAppBar(label: 'Очередь'),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 50,
            child: Container(
              child: Column(
                children: [
                  // FlatRoundedButton(
                  //   text: 'Следующий',
                  //   icon: LineAwesomeIcons.door_open,
                  //   color: Colors.red,
                  //   // textColor: Colors.white,
                  // ),
                  // SizedBox(height: 20),
                  // Row(
                  //   children: [
                  //     FlatRoundedButton(
                  //       text: 'Перерыв',
                  //       icon: LineAwesomeIcons.door_open,
                  //       color: Colors.red,
                  //       // textColor: Colors.white,
                  //       flex: 1,
                  //     ),
                  //     SizedBox(width: 19),
                  //     FlatRoundedButton(
                  //       text: 'Завершить',
                  //       icon: LineAwesomeIcons.share,
                  //       color: MyColors.disabled,
                  //       flex: 1,
                  //       // textColor: Colors.white,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Positioned(child: QueueManagementItem()),
        ],
      ),
    );
  }
}
