import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class QueueManagementItem extends StatelessWidget {
  const QueueManagementItem({Key key}) : super(key: key);

  Widget _buildingBlock(context, final String upperText,
      final String middleText, final String lowerText) {
    return Column(
      children: [
        Text(
          upperText,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          middleText,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        if (lowerText != null)
          Text(
            lowerText,
            style: Theme.of(context).textTheme.subtitle1,
          ),
      ],
    );
  }

  Widget _row(IconData iconData, Widget widgetLeft, Widget widgetRight) {
    return Row(
      children: [
        Icon(iconData),
        widgetLeft,
        if (widgetRight != null) widgetRight,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Клиника DoctorPlus',
          style: Theme.of(context).textTheme.headline5,
        ),
        _row(
          LineAwesomeIcons.user,
          _buildingBlock(context, 'Очередь', '100 чел.', null),
          _buildingBlock(context, 'Макс. длина', '150 чел.', null),
        ),
        _row(
          LineAwesomeIcons.calendar_plus,
          _buildingBlock(context, 'Дата создания', '10.07.2020   9:00', null),
          _buildingBlock(context, 'Дата окончания', '10.07.2020   18:00', null),
        ),
        _row(
          LineAwesomeIcons.clock,
          _buildingBlock(
              context, 'Часы работы', 'Обед 13:00-14:00', 'Обед 13:00-14:00'),
          null,
        ),
        _row(
          LineAwesomeIcons.info,
          _buildingBlock(context, 'Заметка',
              'При себе необходимо иметь ксерокопию паспорта', null),
          null,
        ),
        Text('Текущий №'),
        Text('15'),
      ],
    );
  }
}
