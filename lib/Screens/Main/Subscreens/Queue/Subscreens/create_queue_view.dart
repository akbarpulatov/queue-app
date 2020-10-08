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
  TimeOfDay _startTime;
  TimeOfDay _endTime;

  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;
  bool _switchValue = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void clearFields() {
    print('Fields are cleared');
  }

  void _onPress() {
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
  }

  Widget _buildName() {
    return Container(
      child: FlatTextFieldContainer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Название очереди',
            labelStyle: MyStyles.dimmedText,
          ),
          maxLength: 10,
          maxLengthEnforced: true,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Название очереди необходимо';
            }

            return null;
          },
          onSaved: (String value) {
            _name = value;
          },
        ),
      ),
    );
  }

  Widget _buildStartTime() {
    return DateTimeFieldContainer(
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
    );
  }

  Widget _buildEndTime() {
    return DateTimeFieldContainer(
      isStretched: true,
      label: 'Конец',
      child: TimePicker(
        initTime: TimeOfDay(hour: 18, minute: 00),
      ),
    );
  }

  ///=======================< Break >=====================
  Widget _buildBreakTime() {
    return AnimatedContainer(
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
              height: 30, child: VerticalDivider(color: MyColors.disabled)),
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
    );
  }

  Widget _buildBreakSwitch() {
    return DateTimeFieldContainer(
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
    );
  }

  ///======================< Max Length >====================
  Widget _buildMaxQueue() {
    return FlatTextFieldContainer(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Макс. длина',
          labelStyle: MyStyles.dimmedText,
        ),
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
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      child: FlatTextFieldContainer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Описание',
            hintText: 'Например: при себе необходимо иметь ксерокопию паспорта',
            labelStyle: MyStyles.dimmedText,
            hintMaxLines: 3,
          ),
          maxLength: 10,
          maxLengthEnforced: true,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Название очереди необходимо';
            }

            return null;
          },
          onSaved: (String value) {
            _name = value;
          },
        ),
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return FlatTextFieldContainer(
      child: TextFormField(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Divider divider = Divider(
      indent: 20,
      thickness: 1.2,
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
              _buildStartTime(),
              // divider,
              _buildEndTime(),
              _buildBreakSwitch(),
              _buildBreakTime(),
              _buildMaxQueue(),
              _buildDescription(),

              SizedBox(
                height: 20,
              ),

              RoundedButton(
                text: "Создать",
                color: kPrimaryColor,
                textColor: kBackgroundLightColor,
                press: _onPress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
