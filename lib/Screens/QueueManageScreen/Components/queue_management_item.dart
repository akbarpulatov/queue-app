import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class QueueManagementItem extends StatelessWidget {
  const QueueManagementItem({Key key}) : super(key: key);

  Widget _buildingBlock(context, final String upperText,
      final String middleText, final String lowerText) {
    const double horizontalPadding = 3;
    const double verticalPadding = 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          child: Text(
            upperText,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          child: Text(
            middleText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        if (lowerText != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 3,
              vertical: 3,
            ),
            child: Text(
              lowerText,
              style: Theme.of(context).textTheme.subtitle1,
              maxLines: 5,
            ),
          ),
      ],
    );
  }

  Widget _row(IconData iconData, Widget widgetLeft, Widget widgetRight) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            color: Color(0xFFDEDED5),
            size: 30,
          ),
        ),
        Expanded(child: widgetLeft),
        if (widgetRight != null) Expanded(child: widgetRight),
      ],
    );
  }

  static const _textStyle1 = TextStyle(
    fontSize: 17,
    color: Color(0xFFBDBDB2),
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static const _textStyle2 = TextStyle(
    fontSize: 33,
    color: Color(0xFF282826),
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      indent: 16,
      height: 20,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            'Клиника DoctorPlus',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        _row(
          LineAwesomeIcons.user,
          _buildingBlock(context, 'Очередь', '100 чел.', null),
          _buildingBlock(context, 'Макс. длина', '150 чел.', null),
        ),
        divider,
        _row(
          LineAwesomeIcons.calendar_plus,
          _buildingBlock(context, 'Дата создания', '10.07.2020   9:00', null),
          _buildingBlock(context, 'Дата окончания', '10.07.2020   18:00', null),
        ),
        divider,
        _row(
          LineAwesomeIcons.clock,
          _buildingBlock(
              context, 'Часы работы', 'Обед 13:00-14:00', 'Обед 13:00-14:00'),
          null,
        ),
        divider,
        _row(
          LineAwesomeIcons.info,
          _buildingBlock(context, 'Заметка',
              'При себе необходимо иметь \nксерокопию паспорта', null),
          null,
        ),
        SizedBox(height: 18),
        Center(
          child: Text(
            'Текущий №',
            style: _textStyle1,
          ),
        ),
        SizedBox(height: 5),
        Center(
          child: Text(
            '15',
            style: _textStyle2,
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
