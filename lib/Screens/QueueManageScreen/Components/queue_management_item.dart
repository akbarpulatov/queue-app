import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class QueueManagementItem extends StatelessWidget {
  const QueueManagementItem({Key key}) : super(key: key);

  Widget _buildingBlock(
      final String upperText, final String middleText, final String lowerText) {
    return Column(
      children: [
        Text(upperText),
        Text(middleText),
        if (lowerText != null) Text(lowerText),
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
        Text('Клиника DoctorPlus'),
        _row(
          LineAwesomeIcons.user,
          _buildingBlock('Очередь', '100 чел.', null),
          _buildingBlock('Макс. длина', '150 чел.', null),
        ),
        _row(
          LineAwesomeIcons.calendar_plus,
          _buildingBlock('Дата создания', '10.07.2020   9:00', null),
          _buildingBlock('Дата окончания', '10.07.2020   18:00', null),
        ),
        _row(
          LineAwesomeIcons.clock,
          _buildingBlock('Часы работы', 'Обед 13:00-14:00', 'Обед 13:00-14:00'),
          null,
        ),
        _row(
          LineAwesomeIcons.info,
          _buildingBlock(
              'Заметка', 'При себе необходимо иметь ксерокопию паспорта', null),
          null,
        ),
        Text('Текущий №'),
        Text('15'),
      ],
    );
  }
}
