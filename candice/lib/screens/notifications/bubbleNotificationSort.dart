import 'package:candice/models/appState.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bubbleNotificationSortDesign.dart';

class BubbleNotificationSort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: true);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <BubbleNotificationSortDesign>[
          BubbleNotificationSortDesign(
            title: AppLocalizations.of(context).translate('likes'),
            action: () => appState.reverseNotificationBubbleState(0),
            active: appState.notificationBubbleState[0],
          ),
          BubbleNotificationSortDesign(
            title: AppLocalizations.of(context).translate('comments'),
            action: () => appState.reverseNotificationBubbleState(1),
            active: appState.notificationBubbleState[1],
          ),
          BubbleNotificationSortDesign(
            title: AppLocalizations.of(context).translate('mentions'),
            action: () => appState.reverseNotificationBubbleState(2),
            active: appState.notificationBubbleState[2],
          ),
        ],
      ),
    );
  }
}