import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Технический осмотр автомобиля в ГАИ'),
          Text('Ср. время ожидания: 15 мин.'),
          Row(
            children: [
              Icon(LineAwesomeIcons.clock),
              Column(
                children: [
                  Text('Часы работы'),
                  Text('9:00 - 18:00'),
                  Text('Обед 13:00-14:00'),
                ],
              ),
              Row(
                children: [
                  Icon(LineAwesomeIcons.user),
                  Column(
                    children: [
                      Text('Очередь'),
                      Text('107 чел.'),
                    ],
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Icon(LineAwesomeIcons.info),
              Column(
                children: [
                  Text('Заметка'),
                  Text('При себе необходимо иметь ксерокопию паспорта'),
                ],
              )
            ],
          ),
          Column(
            children: [
              Text('Текущий №'),
              Text('15'),
            ],
          ),
          Row(
            children: [
              FlatButton(onPressed: () {}, child: Text('Наблюдать')),
              FlatButton(onPressed: () {}, child: Text('Занять')),
            ],
          )
        ],
      ),
    );
  }
}
