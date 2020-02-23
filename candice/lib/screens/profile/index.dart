import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/material.dart';

import 'backgroundImage.dart';
import 'contributeBubble.dart';
import 'mainBubble.dart';
import 'statisticsBubble.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isFollowing = true;

  Future<Null> _refreshProfile() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _refreshProfile, // TODO: call to fetch the profile
        child: ListView(
          physics:
              const AlwaysScrollableScrollPhysics(), // TODO: when it goes up the backgroundImage resized and goes with a higher height
          children: <Widget>[
            Stack(children: <Widget>[
              Positioned(
                top: 0,
                child: BackgroundImage(
                    backgroundImage:
                        'https://images.unsplash.com/photo-1580331451062-99ff652288d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
                    height: kBackgroundImageHeight),
              ),
              Positioned(
                  top: 0,
                  right: 5,
                  child: IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {})),
              Column(
                children: <Widget>[
                  const SizedBox(
                      height: kBackgroundImageHeight / 2 +
                          kBackgroundImageHeight / 5),
                  MainBubble(
                      name: 'Laia Montés',
                      photoProfile:
                          'https://images.unsplash.com/photo-1578680671705-0965e325b2ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1233&q=80',
                      profession: 'Singer and Guitarrist',
                      description:
                          'I’m a musician who loves Pop and Rock. 🤘 Currently studying for being a lawyer, but what I truly want is to sing in the shower.',
                      isFollowing: isFollowing),
                  const SizedBox(height: kCommonSeparation),
                  StatisticsBubble(
                      uploads: 36, reproductions: 2000000, hearts: 128000),
                  const SizedBox(height: kCommonSeparation),
                  ContributeBubble(
                    contributeDescription:
                        'Small steps every day will bring what I truly want! 😇',
                  ),
                  const SizedBox(height: kHugeSeparation),
                  TabBarNavigation(),
//                  TabBarView(children: [Text("1"), Text('2')]),
                  const SizedBox(height: kCommonSeparation),
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}

class TabBarNavigation extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[Tab(text: kArtwork), Tab(text: kPastJobs)];

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
                tabs: myTabs,
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
                height: 500,
                child: TabBarView(children: [ArtworkTab(), Text('2')])),
          ],
        ),
      ),
    );
  }
}

class ArtworkTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            PostPreview(
              backgroundImage:
                  'https://images.unsplash.com/photo-1581289098325-fd41f57a9d4e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1601&q=80',
              postTitle: 'Break my soul',
            ),
            const SizedBox(width: kSmallSeparation),
            PostPreview(
              backgroundImage:
                  'https://images.unsplash.com/photo-1581289098325-fd41f57a9d4e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1601&q=80',
              postTitle: 'Break my soul',
            ),
          ],
        ),
        const SizedBox(height: kSmallSeparation),
        Row(
          children: <Widget>[
            PostPreview(
              backgroundImage:
                  'https://images.unsplash.com/photo-1581289098325-fd41f57a9d4e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1601&q=80',
              postTitle: 'Break my soul',
            ),
            const SizedBox(width: kSmallSeparation),
            PostPreview(
              backgroundImage:
                  'https://images.unsplash.com/photo-1581289098325-fd41f57a9d4e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1601&q=80',
              postTitle: 'Break my soul',
            ),
          ],
        ),
      ],
    );
  }
}

class PostPreview extends StatelessWidget {
//  const PostPreview({
//    Key key,
//  }) : super(key: key);
  PostPreview({this.backgroundImage, this.postTitle});
  final String backgroundImage;
  final String postTitle;
  // TODO: Audio/Video

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgroundImage(
            backgroundImage: backgroundImage,
            height: kPostPreviewBackgroundImageHeight),
        Positioned(
          bottom: 12,
          left: 12,
          child: Text(postTitle, style: kWhiteBoldText),
        ),
        Positioned(
          top: kPostPreviewBackgroundImageHeight / 4,
          left: MediaQuery.of(context).size.width / 6 - kSmallSeparation,
          child: Opacity(
            opacity: 0.75,
            child: IconButton(
              icon: Icon(
                  Icons.play_circle_filled /*: Icons.pause_circle_filled */),
              iconSize: 70,
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
