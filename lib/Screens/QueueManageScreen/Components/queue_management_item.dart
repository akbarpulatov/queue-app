import 'package:flutter/material.dart';
import 'package:flutter_auth/model/current_order_view_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class QueueManagementItem extends StatelessWidget {
  const QueueManagementItem({
    Key key,
    this.name,
    this.totalQueue,
    this.maxQueue,
    this.dateCreated,
    this.dateFinish,
    this.workingTime,
    this.breakTime,
    this.note,
    this.currentOrder,
    this.index,
  }) : super(key: key);

  final String name;
  final String totalQueue;
  final String maxQueue;
  final String dateCreated;
  final String dateFinish;
  final String workingTime;
  final String breakTime;
  final String note;
  final int currentOrder;
  @required
  final int index;

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
          _buildingBlock(context, 'Дата создания', dateCreated, null),
          _buildingBlock(context, 'Дата окончания', dateFinish, null),
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
        SizedBox(height: 18),
        Center(
          child: Text(
            'Текущий №',
            style: _textStyle1,
          ),
        ),
        SizedBox(height: 5),
        Center(
          child: CurrentOrderView(index: index),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

class CurrentOrderView extends StatelessWidget {
  const CurrentOrderView({
    Key key,
    this.index,
  }) : super(key: key);

  @required
  final int index;

  @override
  Widget build(BuildContext context) {
    print(index);
    final currentOrderViewModel = Provider.of<CreatedQueueModel>(context);

    return Text(
      currentOrderViewModel.currentOrder(index).toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
