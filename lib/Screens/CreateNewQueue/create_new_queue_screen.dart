import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/begin_date_time_widget.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/break_time_widget.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/data_types.dart';
import 'package:flutter_auth/Screens/CreateQueue/Components/flat_input_decoration.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/time_picker.dart';
import 'package:flutter_auth/Screens/SearchResult/Components/button_container.dart';
import 'package:flutter_auth/constants.dart';

class CreateNewQueueScreen extends StatelessWidget {
  const CreateNewQueueScreen({Key key}) : super(key: key);

  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              // =============== < Name of new queue> ==============
              TextFormField(
                decoration: FlatInputDecoration(labelText: 'Название очереди'),
                onSaved: (val) {},
                validator: (val) {
                  return;
                },
                maxLength: 20,
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
                  print('Begin DateTime is : $val');
                  return;
                },
                onSaved: (val) {},
              ),

              // =============== < End Time of queue> ==============
              FormField<TimeOfDay>(builder: (state) {
                return Row(
                  children: [
                    Expanded(child: Text('Конец')),
                    TimePicker(
                      initTime: TimeOfDay(hour: 18, minute: 00),
                      onChanged: (val) {},
                    ),
                  ],
                );
              }),

              // =============== < Break Time of queue> ==============
              FormField<Break>(
                initialValue: Break(),
                builder: (formFieldState) {
                  return BreakTimeWidget(formFieldState: formFieldState);
                },
                onSaved: (val) {},
                validator: (val) {
                  print(val);
                  return;
                },
              ),

              // =============== < Max order in new queue > ==============
              TextFormField(
                decoration: FlatInputDecoration(labelText: 'Макс. длина'),
                onSaved: (val) {},
                validator: (val) {
                  return;
                },
                maxLength: 3,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: FlatInputDecoration(
                  labelText: 'Описание',
                  hintText:
                      'Например: при себе необходимо \n иметь ксерокопию паспорта',
                ),
                onSaved: (val) {},
                validator: (val) {
                  return;
                },
                maxLength: 50,
              ),

              // =================== < Submit Form > ==================
              ButtonContainer(
                child: Text('submit'),
                onPressed: () {
                  _formKey.currentState.validate();
                },
              )
            ],
          )),
    );
  }
}
