import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/date_time_field_container.dart';
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
            // TimeWheel(
            //   divisorSpacing: 0.0,
            //   fontSize: 17,
            //   height: 50,
            //   // width: 100,
            //   updateTimeChanged: (val) {
            //     print(val);
            //   },
            // ),
            SquaredInputField(
              controller: queueFormName,
              hintText: 'Название очереди',
            ),
            SquaredInputField(
              controller: queueFormStart,
              hintText: 'Начало',
            ),
            DateTimeFieldContainer(),

            SquaredInputField(
              controller: queueFormEnd,
              hintText: 'Конец',
            ),
            SquaredInputField(
              controller: queueFormBreak,
              hintText: 'Перерыв',
            ),
            SquaredInputField(
              controller: queueFormMaxQueue,
              hintText: 'Макс. длина',
            ),
            SquaredInputField(
              controller: queueFormDescription,
              hintText:
                  'Описание (Например: при себе необходимо иметь ксерокопию паспорта)',
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
