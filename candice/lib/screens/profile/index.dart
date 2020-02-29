import 'package:candice/constants/measures.dart';
import 'package:candice/models/appState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'backgroundImage.dart';
import 'contributeBubble.dart';
import 'mainBubble.dart';
import 'settings/settingsPopupMenu.dart';
import 'statisticsBubble.dart';
import 'tabBarNavigation/tabBarNavigation.dart';

class Profile extends StatefulWidget {
  Profile(this.a);
  final String a;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isFollowing = true;

  Future<Null> _refreshProfile() async {}

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: true);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshProfile, // TODO: call to fetch the profile
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              Stack(children: <Widget>[
                Positioned(
                  top: 0,
                  child: BackgroundImage(
                      backgroundImage: appState.currentUser.backgroundImage,
                      height: kBackgroundImageHeight),
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: SettingsPopupMenu(),
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                        height: kBackgroundImageHeight / 2 +
                            kBackgroundImageHeight / 5),
                    MainBubble(
                        name: appState.currentUser.userName,
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
      ),
    );
  }
}
