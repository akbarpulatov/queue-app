import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/date_picker.dart';
import 'package:flutter_auth/Screens/CreateQueue/Components/date_time_field_container.dart';
import 'package:flutter_auth/Screens/CreateQueue/Components/flat_input_decoration.dart';
import 'package:flutter_auth/Screens/CreateQueue/Components/form_field_time_picker.dart';
import 'package:flutter_auth/Screens/CreateQueue/Components/form_field_toggle_button.dart';
import 'package:flutter_auth/Screens/CreateQueue/Components/styles.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/time_picker.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/button_container.dart';
import 'package:flutter_auth/components/flat_text_field_container.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/create_queue_view_model.dart';
import 'package:flutter_auth/services/http_requests.dart';
import 'package:provider/provider.dart';

class CreateQueueScreen extends StatefulWidget {
  const CreateQueueScreen({Key key}) : super(key: key);

  @override
  _CreateQueueScreenState createState() => _CreateQueueScreenState();
}

class _CreateQueueScreenState extends State<CreateQueueScreen> {
  String _name;
  TimeOfDay _startTime;
  DateTime _startDate;
  TimeOfDay _endTime;
  String _maxQueue;
  bool _switchValue = false;
  String _description;

  final _nameController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _maxQueueController = TextEditingController();
  final _switchValueController = TextEditingController();
  final _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void clearFields() {
    print('Fields are cleared');
    _nameController.clear();
    _startTimeController.clear();
    _startDateController.clear();
    _endTimeController.clear();
    _maxQueueController.clear();
    _switchValueController.clear();
    _descriptionController.clear();
  }

  void _onPress() {
    print('Submit is pressed');
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    print(_name);
    print(_startTime);
    print(_startDate);
    print(_endTime);
    print(_maxQueue);
    print(_switchValue);
    print(_description);

    //Send to API
  }

  InputDecoration inputDecoration() {
    return InputDecoration();
  }

  Widget _buildName() {
    return TextFormField(
      decoration: FlatInputDecoration(labelText: 'Название очереди'),
      onSaved: (val) {},
      validator: (val) {
        return;
      },
      maxLength: 20,
    );
  }

  Widget _buildMaxQueue() {
    return TextFormField(
      decoration: FlatInputDecoration(labelText: 'Макс. длина'),
      onSaved: (val) {},
      validator: (val) {
        return;
      },
      maxLength: 3,
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildNote() {
    return TextFormField(
      decoration: FlatInputDecoration(
        labelText: 'Описание',
        hintText: 'Например: при себе необходимо \n иметь ксерокопию паспорта',
      ),
      onSaved: (val) {},
      validator: (val) {
        return;
      },
      maxLength: 50,
    );
  }

  ///========================================================
  ///========================================================
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

  Widget _buildBreakSwitch() {
    return DateTimeFieldContainer(
      isStretched: true,
      label: 'Перерыв',
      child: CupertinoSwitch(
          activeColor: MyColors.enabled,
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
              print('switch value changed');
            });
          }),
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

  ///========================================================

  ///======================< Build Method >====================
  @override
  Widget build(BuildContext context) {
    final createQueueViewModel =
        Provider.of<CreateQueueViewModel>(context, listen: false);

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
              _buildMaxQueue(),
              _buildNote(),
              // _buildBreakSwitch(),
              // _buildBreakTime(),
              FormFieldToggleButton<bool>(
                validator: (val) {
                  return;
                },
                onSaved: (val) {},
                initValue: true,
              ),
              BreakTime(),
              ButtonContainer(
                child: Text('Submit'),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BreakTime extends StatefulWidget {
  const BreakTime({
    Key key,
  }) : super(key: key);

  @override
  _BreakTimeState createState() => _BreakTimeState();
}

class _BreakTimeState extends State<BreakTime>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateQueueViewModel>(
      builder:
          (BuildContext context, CreateQueueViewModel viewModel, Widget child) {
        if (viewModel.hasBreak) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
        return SizeTransition(
          sizeFactor: _controller,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: FormFieldTimePicker<TimeOfDay>(
                  initValue: TimeOfDay(hour: 13, minute: 00),
                  label: 'С',
                  onSaved: (val) {},
                  validator: (val) {
                    return 'asdf';
                  },
                ),
              ),
              Container(
                  height: 30, child: VerticalDivider(color: MyColors.disabled)),
              Expanded(
                flex: 1,
                child: FormFieldTimePicker<TimeOfDay>(
                  initValue: TimeOfDay(hour: 14, minute: 00),
                  label: 'До',
                  onSaved: (val) {},
                  validator: (val) {
                    return;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
