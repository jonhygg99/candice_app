import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/material.dart';

import 'bubbleMessageDesign.dart';

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
                          children: [MessagesTab(), NotificationsTab()])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MessagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BubbleMessageDesign(
          profilePic:
              'https://images.unsplash.com/photo-1583129554586-fc0443875a57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1301&q=80',
          userName: 'Arlene Fox',
          lastMessage: 'When we will sing together? 😇',
          newMessages: 2,
          story: true,
        ),
        BubbleMessageDesign(
          profilePic:
              'https://images.unsplash.com/photo-1580851935978-f6b4e359da3f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
          userName: 'James Calvo',
          lastMessage: 'You have a beautiful voice!',
        )
      ],
    );
  }
}
