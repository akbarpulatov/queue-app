import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/styles.dart';
import 'package:flutter_auth/components/button_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/view_models/create_new_queue_view_model.dart';
import 'package:provider/provider.dart';

class AlertWindow extends StatefulWidget {
  const AlertWindow({Key key}) : super(key: key);

  @override
  _AlertWindowState createState() => _AlertWindowState();
}

class _AlertWindowState extends State<AlertWindow> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CreateNewQueueViewModel>(context);

    return AlertDialog(
      content: Container(
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Вы действительно хотите создать очередь?',
              style: Styles.textStyleAlertHeader,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Начать сразу?',
                  style: Styles.textStyleAlertBody,
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 10),
                CupertinoSwitch(
                    activeColor: kPrimaryColor,
                    value: !model.isPaused,
                    onChanged: (val) {
                      setState(() {
                        model.isPaused = !val;
                      });
                    }),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
//=================< Cancel Button >=================
                ButtonContainer(
                  flex: 1,
                  onPressed: () {
                    print('Cancel is pressed in alert menu');
                    Navigator.of(context).pop();
                  },
                  borderColor: MyColors.disabled,
                  child: Text(
                    'Отмена',
                    style: Styles.textStyleButton,
                  ),
                ),
                SizedBox(width: 20),

//=================< Book Approve Button >=================
                ButtonContainer(
                  flex: 1,
                  onPressed: () {
                    model.create();
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  borderColor: MyColors.enabled,
                  fillColor: MyColors.enabled,
                  child: Text(
                    'Создать',
                    style: Styles.textStyleButton.merge(
                      TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
