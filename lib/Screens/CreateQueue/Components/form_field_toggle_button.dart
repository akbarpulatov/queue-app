import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/model/create_queue_view_model.dart';
import 'package:provider/provider.dart';

class FormFieldToggleButton<T> extends StatefulWidget {
  const FormFieldToggleButton({
    Key key,
    this.validator,
    this.onSaved,
    this.initValue,
  }) : super(key: key);

  final FormFieldValidator<T> validator;
  final FormFieldSetter<T> onSaved;
  final T initValue;

  @override
  _FormFieldToggleButtonState<T> createState() =>
      _FormFieldToggleButtonState<T>();
}

class _FormFieldToggleButtonState<T> extends State<FormFieldToggleButton<T>> {
  @override
  Widget build(BuildContext context) {
    final createQueueViewModel =
        Provider.of<CreateQueueViewModel>(context, listen: false);

    return FormField(builder: (FormFieldState formFieldState) {
      return Row(
        children: [
          Text('Перерыв'),
          CupertinoSwitch(
              value: createQueueViewModel.hasBreak,
              onChanged: (val) {
                createQueueViewModel.hasBreak = val;
                formFieldState.didChange(val);
              }),
        ],
      );
    });
  }
}
