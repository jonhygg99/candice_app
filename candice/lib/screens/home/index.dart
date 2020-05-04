import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:flutter/material.dart';

import 'post/posts.dart';
import 'story/stories.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  double scrollPosition;

  @override
  void initState() {
    _scrollViewController = ScrollController();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0)
      ..addListener(() => _scrollViewController.animateTo(
            0.0,
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 1),
          ));
    super.initState();
  }

  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          body: NestedScrollView(
            controller: _scrollViewController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: InkWell(
                    child: const Text(kCandice, style: kLogoText),
                    onTap: () => scrollToTop(),
                  ),
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  pinned: true,
                  floating: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    unselectedLabelColor: Colors.black54,
                    labelColor: kPink,
                    unselectedLabelStyle: kMediumBoldText,
                    labelStyle: kMediumBoldText,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.transparent,
//                    controller: _tabController,
                    tabs: <Tab>[
                      Tab(
                        text:
                            AppLocalizations.of(context).translate('following'),
                      ),
                      Tab(
                        text:
                            AppLocalizations.of(context).translate('trending'),
                      )
                    ],
                  ),
                ),
              ];
            },
            body: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Padding(
                padding: const EdgeInsets.only(top: kCommonSeparation),
                child: TabBarView(
                  children: [
                    PostSection(), // TODO: Following
                    PostSection(), // TODO: Trending
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void scrollToTop() {
    _scrollViewController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
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
