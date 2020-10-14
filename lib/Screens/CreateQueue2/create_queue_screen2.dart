import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateQueue2/Components/FieldContainer.dart';
import 'package:flutter_auth/Screens/CreateQueue/Components/date_time_field_container.dart';
import 'package:flutter_auth/Screens/CreateQueue/Components/time_picker.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/button_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/create_queue_view_model.dart';
import 'package:provider/provider.dart';

class CreateQueueScreen2 extends StatefulWidget {
  const CreateQueueScreen2({Key key}) : super(key: key);

  static const _paddingForBreak = EdgeInsets.symmetric(horizontal: 10);

  @override
  _CreateQueueScreen2State createState() => _CreateQueueScreen2State();
}

class _CreateQueueScreen2State extends State<CreateQueueScreen2> {
  bool _switchValue = true;

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
            });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final createQueueViewModel =
        Provider.of<CreateQueueViewModel>(context, listen: false);
    final _formKey = GlobalKey<FormState>();

    final breakTime = Consumer<CreateQueueViewModel>(
        builder: (BuildContext context, viewModel, Widget child) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: createQueueViewModel.hasBreak == true ? 40 : 0,
        child: Row(
          children: [
            FieldContainer(
              leading: const Text('С'),
              trailing: TimePickerBegin(),
            ),
            VerticalDivider(),
            FieldContainer(
              leading: const Text('До'),
              trailing: TimePickerEnd(),
            ),
          ],
        ),
      );
    });

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
                trailing: Consumer<CreateQueueViewModel>(
                    builder: (BuildContext context, viewModel, Widget child) {
                  return CupertinoSwitch(
                    activeColor: MyColors.enabled,
                    value: viewModel.hasBreak,
                    onChanged: (value) {
                      viewModel.hasBreak = value;
                    },
                  );
                }),
                isStretched: true,
              ),
              breakTime,
              _buildBreakSwitch(),
              _buildBreakTime(),
            ],
          ),
        ),
      ),
    );
  }
}

class TimePickerBegin extends StatelessWidget {
  const TimePickerBegin({
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
    final createQueueViewModel =
        Provider.of<CreateQueueViewModel>(context, listen: false);

    return FlatButton(
      child: Consumer<CreateQueueViewModel>(
          builder: (BuildContext context, value, Widget child) {
        return Text('${value.breakEnd.format(context)}');
      }),
      onPressed: () async {
        createQueueViewModel.breakEnd = await showTimePicker(
                context: context, initialTime: createQueueViewModel.breakEnd) ??
            createQueueViewModel.breakEnd;
      },
    );
  }
}
