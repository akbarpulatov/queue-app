import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Home/Components/flat_button.dart';
import 'package:flutter_auth/Screens/QueueManageScreen/Components/queue_management_item.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/button_container.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/styles.dart';
import 'package:flutter_auth/components/AppBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/current_order_view_model.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class QueueManagementScreen extends StatelessWidget {
  @required
  final index;
  const QueueManagementScreen({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentOrderViewModel = Provider.of<CreatedQueueModel>(context);

    final sizedbox = SizedBox(width: 3);

    // currentOrderViewModel.currentOrder = 15;
    return Scaffold(
      appBar: FlatAppBar(label: 'Очередь'),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 20,
            width: DisplaySize.size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ButtonContainer(
                    onPressed: () {
                      currentOrderViewModel.increment(index);
                    },
                    borderColor: Color(0xFFB5B5AD),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(LineAwesomeIcons.arrow_right),
                        sizedbox,
                        Text('Следующий'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ButtonContainer(
                        flex: 1,
                        onPressed: () {},
                        borderColor: Color(0xFFF3BA26),
                        fillColor: Color(0xFFF3BA26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              LineAwesomeIcons.hourglass,
                              color: Colors.white,
                            ),
                            sizedbox,
                            Text(
                              'Перерыв',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .merge(TextStyle(color: Color(0xFFFFFFFF))),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      ButtonContainer(
                        flex: 1,
                        onPressed: () {},
                        borderColor: Color(0xFFE0503D),
                        fillColor: Color(0xFFE0503D),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              LineAwesomeIcons.times,
                              color: Colors.white,
                            ),
                            sizedbox,
                            Text(
                              'Завершить',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .merge(TextStyle(color: Color(0xFFFFFFFF))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              child: QueueManagementItem(
            name: queueList[index].name,
            dateCreated: queueList[index].createdTime,
            totalQueue: '100',
            maxQueue: '150',
            workingTime: '9:00 - 18:00',
            breakTime: '13:00-14:00',
            dateFinish: '10.07.2020   18:00',
            note: 'При себе необходимо иметь \nксерокопию паспорта',
            index: index,
          )),
        ],
      ),
    );
  }
}
