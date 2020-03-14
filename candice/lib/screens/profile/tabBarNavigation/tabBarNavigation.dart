import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:candice/models/user/post.dart';
import 'package:flutter/material.dart';

import 'artworkTab.dart';
import 'pastJobsTab.dart';

class TabBarNavigation extends StatelessWidget {
  TabBarNavigation({this.posts});
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                  Tab(text: AppLocalizations.of(context).translate('artwork')),
                  Tab(text: AppLocalizations.of(context).translate('pastJobs'))
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
            SizedBox(
                height: 500, // TODO: depends on how many or try to do Expand
                child:
                    TabBarView(children: [ArtworkTab(posts), PastJobsTab()])),
          ],
        ),
      ),
    );
  }
}
