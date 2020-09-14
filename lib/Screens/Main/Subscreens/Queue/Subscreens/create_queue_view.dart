import 'package:flutter/material.dart';
import 'package:flutter_auth/components/squared_input_field.dart';

class CreateQueueScreen extends StatelessWidget {
  const CreateQueueScreen({Key key}) : super(key: key);

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
      body: Column(
        children: [
          SquaredInputField(
            hintText: 'Название очереди',
          ),
          SquaredInputField(
            hintText: 'Начало',
          ),
          SquaredInputField(
            hintText: 'Конец',
          ),
          SquaredInputField(
            hintText: 'Перерыв',
          ),
          SquaredInputField(
            hintText: 'Макс. длина',
          ),
          SquaredInputField(
            hintText:
                'Описание (Например: при себе необходимо иметь ксерокопию паспорта)',
          ),
        ],
      ),
    );
  }
}
