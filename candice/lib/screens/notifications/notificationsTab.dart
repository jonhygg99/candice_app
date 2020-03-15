import 'package:candice/constants/measures.dart';
import 'package:flutter/material.dart';

import 'bubbleNotificationSort.dart';

class NotificationsTab extends StatefulWidget {
  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BubbleNotificationSort(),
        const SizedBox(height: kCommonSeparation),
        Text('down')
      ],
    );
  }
}
