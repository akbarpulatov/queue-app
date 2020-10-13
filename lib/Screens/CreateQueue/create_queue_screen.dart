import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateQueue/Components/FieldContainer.dart';
import 'package:flutter_auth/Screens/Main/Subscreens/Queue/Components/date_time_field_container.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/button_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/create_queue_view_model.dart';
import 'package:provider/provider.dart';

class CreateQueueScreen2 extends StatelessWidget {
  const CreateQueueScreen2({Key key}) : super(key: key);

  static const _paddingForBreak = EdgeInsets.symmetric(horizontal: 10);

  @override
  Widget build(BuildContext context) {
    final createQueueViewModel = Provider.of<CreateQueueViewModel>(context);
    final _formKey = GlobalKey<FormState>();

    final breakTime = AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      height: createQueueViewModel.hasBreak == true ? 40 : 0,
      child: Row(
        children: [
          FieldContainer(
            leading: const Text('С'),
            trailing: TimePicker(),
          ),
          VerticalDivider(),
          FieldContainer(
            leading: const Text('До'),
            trailing: TimePickerEnd(),
          ),
        ],
      ),
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
                /// clearFields
              },
              child: Center(
                child: const Text(
                  'Очистить',
                  style: TextStyle(
                    color: MyColors.disabled,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      ///================< Column >================
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              FieldContainer(
                leading: const Text('Перерыв'),
                trailing: CupertinoSwitch(
                  activeColor: MyColors.enabled,
                  value: createQueueViewModel.hasBreak,
                  onChanged: (value) {
                    createQueueViewModel.hasBreak = value;
                  },
                ),
                isStretched: true,
              ),
              breakTime,
            ],
          ),
        ),
      ),
    );
  }
}

class TimePicker extends StatelessWidget {
  const TimePicker({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createQueueViewModel = Provider.of<CreateQueueViewModel>(context);

    return FlatButton(
      child: Text('${createQueueViewModel.breakBegin.format(context)}'),
      onPressed: () async {
        createQueueViewModel.breakBegin = await showTimePicker(
                context: context,
                initialTime: createQueueViewModel.breakBegin) ??
            createQueueViewModel.breakBegin;
      },
    );
  }
}

class TimePickerEnd extends StatelessWidget {
  const TimePickerEnd({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createQueueViewModel = Provider.of<CreateQueueViewModel>(context);

    return FlatButton(
      child: Text('${createQueueViewModel.breakEnd.format(context)}'),
      onPressed: () async {
        createQueueViewModel.breakEnd = await showTimePicker(
                context: context, initialTime: createQueueViewModel.breakEnd) ??
            createQueueViewModel.breakEnd;
      },
    );
  }
}
