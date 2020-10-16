import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/QueueManageScreen/Components/queue_management_item.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/button_container.dart';
import 'package:flutter_auth/components/AppBar.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/view_models/queue_managa_view_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class QueueManagementScreen extends StatelessWidget {
  @required
  final index;
  const QueueManagementScreen({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model =
        Provider.of<QueueManageScreenViewModel>(context, listen: false);

    final sizedbox = SizedBox(width: 3);

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
          Positioned(child: QueueManagementItem(index: index)),
        ],
      ),
    );
  }
}
