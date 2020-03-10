import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/appState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'messagesTab.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: scroll
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPink,
        child: Icon(Icons.add),
        onPressed: () => print('pressed'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: kBigSeparation),
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Padding(
              padding: kPaddingTabBar,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: TabBar(
//            controller: TabController(length: 2, vsync: this),
                      tabs: <Tab>[
                        Tab(text: kMessages),
                        Tab(text: kNotifications)
                      ],
                      unselectedLabelColor: Colors.black54,
                      labelColor: Colors.black,
                      unselectedLabelStyle: kBoldText,
                      labelStyle: kBoldText,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: kCommonSeparation),
                  Expanded(
                    child: TabBarView(
                        children: [MessagesTab(), NotificationsTab()]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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

class BubbleNotificationSort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: true);
    return Row(
      children: <BubbleNotificationSortDesign>[
        BubbleNotificationSortDesign(
          title: kLikes,
          action: () => appState.reverseNotificationBubbleState(0),
          active: appState.notificationBubbleState[0],
        ),
        BubbleNotificationSortDesign(
          title: kComments,
          action: () => appState.reverseNotificationBubbleState(1),
          active: appState.notificationBubbleState[1],
        ),
        BubbleNotificationSortDesign(
          title: kMentions,
          action: () => appState.reverseNotificationBubbleState(2),
          active: appState.notificationBubbleState[2],
        ),
      ],
    );
  }
}

class BubbleNotificationSortDesign extends StatelessWidget {
  BubbleNotificationSortDesign(
      {@required this.title, this.action, this.active});
  final String title;
  final Function action;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kSmallSeparation),
      child: InkWell(
          borderRadius: BorderRadius.all(kBorderRadiusCircle),
          onTap: action,
          child: Container(
            padding: kPaddingBubbleNotificationSort,
            decoration: BoxDecoration(
                color: active ? kPink : Colors.white,
                border:
                    Border.all(width: 3, color: active ? kPink : Colors.black),
                borderRadius: BorderRadius.all(kBorderRadiusCircle)),
            child: Text(
              title,
              style: TextStyle(
                color: active ? Colors.white : Colors.black,
                fontFamily: kRobotoBold,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
    );
  }
}
