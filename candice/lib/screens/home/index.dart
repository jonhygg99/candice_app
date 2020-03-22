import 'package:candice/constants/colors.dart';
import 'package:candice/constants/texts.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:flutter/material.dart';

import 'post/posts.dart';
import 'story/stories.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              kCandice,
              style: kLogoText,
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: AppLocalizations.of(context).translate('following')),
                Tab(text: AppLocalizations.of(context).translate('trending'))
              ],
              unselectedLabelColor: Colors.black54,
              labelColor: kPink,
              unselectedLabelStyle: kMediumBoldText,
              labelStyle: kMediumBoldText,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.transparent,
            ),
          ),
          body: TabBarView(
            children: [
              PostSection(), // TODO: Following
              PostSection(), // TODO: Trending Network images instead of cache
            ],
          ),
        ),
      ),
    );
  }
}

class PostSection extends StatelessWidget {
  Future<Null> _refreshHome() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshHome, // TODO: call to fetch the home
      child: ListView(
        children: <Widget>[
          Stories(),
          Posts(),
        ],
      ),
    );
  }
}
