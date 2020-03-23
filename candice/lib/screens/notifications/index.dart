import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:flutter/material.dart';

import 'messagesTab.dart';
import 'notificationsTab.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: scroll
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPink,
        child: Icon(Icons.add),
        onPressed: () => print(Localizations.localeOf(context)),
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
                    padding: EdgeInsets.all(kTinySeparation),
                    decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: TabBar(
//            controller: TabController(length: 2, vsync: this),
                      tabs: <Tab>[
                        Tab(
                          text: AppLocalizations.of(context)
                              .translate('messages'),
                        ),
                        Tab(
                          text: AppLocalizations.of(context)
                              .translate('notifications'),
                        )
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
                  const SizedBox(height: kMediumSeparation),
                  Expanded(
                    child: TabBarView(children: [
                      MessagesTab(),
                      NotificationsTab(),
                    ]),
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
