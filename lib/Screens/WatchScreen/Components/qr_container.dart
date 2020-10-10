import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrContainer extends StatelessWidget {
  const QrContainer({
    Key key,
    @required this.idQueue,
  }) : super(key: key);

  final String idQueue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF4F4E5),
          borderRadius: BorderRadius.circular(20),
        ),
        width: 188,
        height: 277,
        child: Column(
          children: [
            SizedBox(height: 9),
            QrImage(
              data: idQueue,
              version: QrVersions.auto,
              size: 170.0,
            ),
            Divider(),
            SizedBox(height: 5),
            Text(
              'Код очереди',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: 5),
            Text(
              idQueue,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
