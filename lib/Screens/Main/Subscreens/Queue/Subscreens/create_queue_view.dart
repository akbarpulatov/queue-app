import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/background.dart';
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
  bool _switchValue = false;

  TextEditingController queueFormName = new TextEditingController();
  TextEditingController queueFormStart = new TextEditingController();
  TextEditingController queueFormEnd = new TextEditingController();
  TextEditingController queueFormBreak = new TextEditingController();
  TextEditingController queueFormMaxQueue = new TextEditingController();
  TextEditingController queueFormDescription = new TextEditingController();

  void clearFields() {
    queueFormName.text = '';
    queueFormStart.text = '';
    queueFormEnd.text = '';
    queueFormBreak.text = '';
    queueFormMaxQueue.text = '';
    queueFormDescription.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final Divider divider = Divider(
      indent: 20,
      height: 1,
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
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  clearFields();
                },
                child: Center(
                  child: Text(
                    'Очистить',
                    style: TextStyle(
                      color: MyColors.disabled,
                      fontSize: 15,
                    ),
                  ),
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            DateTimeFieldContainer(
              isStretched: true,
              label: 'Перерыв',
              child: CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                      print('switch value changed');
                    });
                  }),
            ),

            ///=======================< Break >=====================
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: _switchValue == false ? 0 : 40,
              child: Row(
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
            ),

            ///======================< Max Length >====================
            divider,
            SquaredInputField(
                controller: queueFormMaxQueue,
                hintText: 'Макс. длина',
                keyboardType: TextInputType.number),
            divider,
            SquaredInputField(
              controller: queueFormDescription,
              hintText:
                  'Описание\n(Например: при себе необходимо иметь ксерокопию паспорта)',
            ),
            divider,
            // Expanded(child: SizedBox()),
            SizedBox(
              height: 20,
            ),
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
