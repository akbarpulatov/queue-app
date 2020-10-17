import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/begin_date_time_widget.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/break_time_widget.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/data_types.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/styles.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/flat_input_decoration.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/time_picker.dart';
import 'package:flutter_auth/components/button_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/view_models/create_new_queue_view_model.dart';
import 'package:provider/provider.dart';

class CreateNewQueueScreen extends StatelessWidget {
  const CreateNewQueueScreen({Key key}) : super(key: key);

  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static const divider = Divider(
    height: 1,
    color: ColorStyles.dividerColor,
  );

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CreateNewQueueViewModel>(context, listen: false);

    return Scaffold(
      // ================== < Appbar > =================
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
                  // clearFields();
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

      // =================== < Forms > ==================
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                // =============== < Name of new queue> ==============
                TextFormField(
                  decoration:
                      FlatInputDecoration(labelText: 'Название очереди'),
                  maxLength: 20,
                  validator: (val) {
                    print('Name: $val');
                    return;
                  },
                  onSaved: (val) {
                    model.name = val;
                  },
                ),

                // =============== < Begin DateTime of queue> ==============
                FormField<DateAndTime>(
                  initialValue: DateAndTime(),
                  builder: (state) {
                    return BeginDateTimeWidget(
                      state: state,
                    );
                  },
                  validator: (val) {
                    print('BeginDate: $val');
                    return;
                  },
                  onSaved: (val) {
                    model.workingTimeBegin = val.timeOfDay;
                    model.dateCreated = val.dateTime;
                  },
                ),
                divider,

                // =============== < End Time of queue> ==============
                FormField<TimeOfDay>(
                  initialValue: TimeOfDay(hour: 18, minute: 00),
                  builder: (state) {
                    return Row(
                      children: [
                        Expanded(
                            child: Text('Конец', style: TextStyles.labelStyle)),
                        TimePicker(
                          initTime: state.value,
                          onChanged: state.didChange,
                        ),
                      ],
                    );
                  },
                  validator: (val) {
                    print('EndTime: $val');
                    return;
                  },
                  onSaved: (val) {
                    model.workingTimeEnd = val;
                  },
                ),
                divider,

                // =============== < Break Time of queue> ==============
                FormField<Break>(
                  initialValue: Break(),
                  builder: (state) {
                    return BreakTimeWidget(state: state);
                  },
                  validator: (val) {
                    print('BreakTime: $val');
                    return;
                  },
                  onSaved: (val) {
                    model.hasBreak = val.hasBreak;
                    model.breakTimeBegin = val.beginTime;
                    model.breakTimeEnd = val.endTime;
                  },
                ),
                divider,

                // =============== < Max order in new queue > ==============
                TextFormField(
                  decoration: FlatInputDecoration(labelText: 'Макс. длина'),
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    print('MaxQueue: $val');
                    return;
                  },
                  onSaved: (val) {
                    model.maxQueue = int.parse(val);
                  },
                ),

                // ================== < Note Form Field > =================
                TextFormField(
                  decoration: FlatInputDecoration(
                    labelText: 'Описание',
                    hintText:
                        'Например: при себе необходимо \n иметь ксерокопию паспорта',
                  ),
                  maxLength: 50,
                  validator: (val) {
                    print('Note: $val');
                    return;
                  },
                  onSaved: (val) {
                    model.note = val;
                  },
                ),

                // =================== < Submit Form > ==================
                ButtonContainer(
                    child: Text('submit'),
                    onPressed: () {
                      print('Submit is pressed');
                      if (!_formKey.currentState.validate()) {
                        return;
                      }

                      _formKey.currentState.save();

                      model.create();
                      Navigator.pop(context);

                      //Send to API
                    })
              ],
            )),
      ),
    );
  }
}
