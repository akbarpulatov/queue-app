import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateQueue/Components/styles.dart';
import 'package:flutter_auth/Screens/CreateNewQueue/Components/time_picker.dart';

class FormFieldTimePicker<T> extends StatelessWidget {
  const FormFieldTimePicker({
    Key key,
    this.validator,
    this.onSaved,
    this.isStretched,
    this.label,
    this.initValue,
  }) : super(key: key);

  final FormFieldValidator<T> validator;
  final FormFieldSetter<T> onSaved;
  final bool isStretched;
  final String label;
  final T initValue;

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState formFieldState) {
        return Column(
          children: [
            Row(
              children: [
                if (label != null)
                  Text(
                    label,
                  ),
                if (isStretched == true) Expanded(child: SizedBox()),
                TimePicker(
                  initTime: initValue as TimeOfDay,
                  onChanged: (val) {
                    formFieldState.didChange(val);
                  },
                ),
              ],
            ),
            if (formFieldState.hasError)
              Text(formFieldState.errorText, style: Styles.errorStyle)
          ],
        );
      },
      initialValue: initValue,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
