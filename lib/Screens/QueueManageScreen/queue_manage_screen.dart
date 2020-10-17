import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/QueueManageScreen/Components/queue_management_item.dart';
import 'package:flutter_auth/components/button_container.dart';
import 'package:flutter_auth/components/AppBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:flutter_auth/view_models/queue_managa_view_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class QueueManagementScreen extends StatelessWidget {
  @required
  final index;
  const QueueManagementScreen({Key key, this.index}) : super(key: key);

  static const sizedbox = SizedBox(width: 3);

  @override
  Widget build(BuildContext context) {
    final model =
        Provider.of<QueueManageScreenViewModel>(context, listen: true);

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

//=====================< Next Queue Button >=======================
              child: Column(
                children: [
                  if (Navbat.queueList[index].isPaused == false)
                    ButtonContainer(
                      onPressed: () => model.increment(index),
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

//=====================< Break Button >=======================
                  Row(
                    children: [
                      Navbat.queueList[index].isPaused == false
                          ? ButtonContainer(
                              flex: 1,
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
                                        .merge(TextStyle(
                                            color: Color(0xFFFFFFFF))),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                model.pause(index);
                              },
                            )

//=====================< Button Continue Queue >=======================
                          : ButtonContainer(
                              flex: 1,
                              borderColor: kPrimaryColor,
                              fillColor: kPrimaryColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    LineAwesomeIcons.hourglass,
                                    color: Colors.white,
                                  ),
                                  sizedbox,
                                  Text(
                                    'Продолжить',
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        .merge(TextStyle(
                                            color: Color(0xFFFFFFFF))),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                model.cont(index);
                              },
                            ),
                      SizedBox(width: 15),

//=====================< End Queue Button >=======================
                      ButtonContainer(
                        flex: 1,
                        onPressed: () {
                          model.remove(index);
                          Navigator.pop(context);
                        },
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

//=====================< Queue Managament Item >=======================
          Positioned(child: QueueManagementItem(index: index)),
        ],
      ),
    );
  }
}
