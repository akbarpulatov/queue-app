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
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _builURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Url'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'URL is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Calories'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _calories = value;
      },
    );
  }

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

      ///==============< Column >==============
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildName(),
              _buildEmail(),
              _buildPassword(),
              _builURL(),
              _buildPhoneNumber(),
              _buildCalories(),
              SizedBox(height: 100),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  print('Submit is pressed');
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  print(_name);
                  print(_email);
                  print(_phoneNumber);
                  print(_url);
                  print(_password);
                  print(_calories);

                  //Send to API
                },
              ),

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
      ),
    );
  }
}
