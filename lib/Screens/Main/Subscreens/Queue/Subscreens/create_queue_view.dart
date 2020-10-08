import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/date_picker.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/date_time_field_container.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/time_picker.dart';
import 'package:flutter_auth/components/flat_text_field_container.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/squared_input_field.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/services/http_requests.dart';

class CreateQueueScreen extends StatefulWidget {
  const CreateQueueScreen({Key key}) : super(key: key);

  @override
  _CreateQueueScreenState createState() => _CreateQueueScreenState();
}

class _CreateQueueScreenState extends State<CreateQueueScreen> {
  TextEditingController queueFormName = new TextEditingController();
  TextEditingController queueFormStart = new TextEditingController();
  TextEditingController queueFormEnd = new TextEditingController();
  TextEditingController queueFormBreak = new TextEditingController();
  TextEditingController queueFormMaxQueue = new TextEditingController();
  TextEditingController queueFormDescription = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Divider divider = Divider(
      indent: 20,
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Создать очередь',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SquaredInputField(
              controller: queueFormName,
              hintText: 'Название очереди',
            ),
            divider,
            DateTimeFieldContainer(
              isStretched: true,
              label: 'Начало',
              child: Row(
                children: [
                  DatePicker(),
                  TimePicker(
                    initTime: TimeOfDay(hour: 9, minute: 00),
                  ),
                ],
              ),
            ),
            divider,
            DateTimeFieldContainer(
              isStretched: true,
              label: 'Конец',
              child: TimePicker(
                initTime: TimeOfDay(hour: 18, minute: 00),
              ),
            ),
            divider,
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: DateTimeFieldContainer(
                    isStretched: false,
                    label: 'С',
                    child: TimePicker(
                      initTime: TimeOfDay(hour: 13, minute: 00),
                    ),
                  ),
                ),
                Container(
                    height: 30,
                    child: VerticalDivider(color: MyColors.disabled)),
                Expanded(
                  flex: 1,
                  child: DateTimeFieldContainer(
                    isStretched: false,
                    label: 'До',
                    child: TimePicker(
                      initTime: TimeOfDay(hour: 14, minute: 00),
                    ),
                  ),
                ),
              ],
            ),
            divider,
            SquaredInputField(
              controller: queueFormBreak,
              hintText: 'Перерыв',
            ),
            divider,
            SquaredInputField(
              controller: queueFormMaxQueue,
              hintText: 'Макс. длина',
            ),
            divider,
            SquaredInputField(
              controller: queueFormDescription,
              hintText:
                  'Описание (Например: при себе необходимо иметь ксерокопию паспорта)',
            ),
            divider,
            RoundedButton(
              text: "Создать",
              color: kPrimaryColor,
              textColor: kBackgroundLightColor,
              press: () {
                // TODO: make HTTP Post
                print(queueFormName.text);
                print(queueFormStart.text);
                print(queueFormEnd.text);
                print(queueFormBreak.text);
                print(queueFormMaxQueue.text);
                print(queueFormDescription.text);

                httpRequest.postHttp(MyUrls.postQueueList);
                // queueFormName.text = '';
                // queueFormStart.text = '';
                // queueFormEnd.text = '';
                // queueFormBreak.text = '';
                // queueFormMaxQueue.text = '';
                // queueFormDescription.text = '';

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return SignUpScreen();
                //     },
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
