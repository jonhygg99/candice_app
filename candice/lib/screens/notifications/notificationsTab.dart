import 'package:candice/constants/measures.dart';
import 'package:flutter/material.dart';

import 'bubbleNotificationSort.dart';

class NotificationsTab extends StatefulWidget {
  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> {
  Future<Null> _refreshNotifications() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshNotifications, // TODO: call to fetch the notification
      child: ListView(
        children: <Widget>[
          BubbleNotificationSort(),
          const SizedBox(height: kCommonSeparation),
          Text('down')
        ],
      ),
    );
  }
}
