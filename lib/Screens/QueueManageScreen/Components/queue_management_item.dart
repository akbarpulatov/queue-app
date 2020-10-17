import 'package:flutter/material.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:flutter_auth/view_models/queue_managa_view_model.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class QueueManagementItem extends StatelessWidget {
  const QueueManagementItem({
    Key key,
    this.index,
  }) : super(key: key);

  @required
  final int index;

  static const divider = Divider(
    indent: 16,
    height: 20,
  );

  Widget _buildingBlock(context, final String upperText,
      final String middleText, final String lowerText) {
    const double horizontalPadding = 3;
    const double verticalPadding = 1;

    return SingleChildScrollView(
      child: Column(
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
      ),
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

  @override
  Widget build(BuildContext context) {
    final name = Navbat.queueList[index].name;
    final totalQueue = Navbat.queueList[index].totalQueue;
    final maxQueue = Navbat.queueList[index].maxQueue;

    final _dateCreatedDate = Navbat.queueList[index].dateCreated;
    final createdTime = DateFormat('d.MM.yyyy  H:mm').format(_dateCreatedDate);

    final _dateEnd = Navbat.queueList[index].dateEnd;
    final dateEnd = DateFormat('d.MM.yyyy  H:mm').format(_dateEnd);

    final workingTimeBegin =
        Navbat.queueList[index].workingTimeBegin.format(context);
    final workingTimeEnd =
        Navbat.queueList[index].workingTimeEnd.format(context);
    final workingTime = '$workingTimeBegin - $workingTimeEnd';

    final breakTimeBegin =
        Navbat.queueList[index].breakTimeBegin.format(context);
    final breakTimeEnd = Navbat.queueList[index].breakTimeEnd.format(context);
    final breakTime = '$breakTimeBegin-$breakTimeEnd';

    final note = Navbat.queueList[index].note;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            name,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        _row(
          LineAwesomeIcons.user,
          _buildingBlock(context, 'Очередь', '$totalQueue чел.', null),
          _buildingBlock(context, 'Макс. длина', '$maxQueue чел.', null),
        ),
        divider,
        _row(
          LineAwesomeIcons.calendar_plus,
          _buildingBlock(context, 'Дата создания', createdTime, null),
          _buildingBlock(context, 'Дата окончания', dateEnd, null),
        ),
        divider,
        _row(
          LineAwesomeIcons.clock,
          _buildingBlock(
              context, 'Часы работы', workingTime, 'Обед $breakTime'),
          null,
        ),
        divider,
        _row(
          LineAwesomeIcons.info,
          _buildingBlock(context, 'Заметка', note, null),
          null,
        ),
        const SizedBox(height: 18),
        Center(
          child: Text(
            'Текущий №',
            style: _textStyle1,
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Builder(builder: (context) {
            return Consumer<QueueManageScreenViewModel>(
              builder: (context, model, child) {
                return Text(
                  model.currentOrder(index).toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            );
          }),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
