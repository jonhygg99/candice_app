import 'package:candice/constants/measures.dart';
import 'package:candice/models/user/user.dart';
import 'package:flutter/material.dart';

import '../../common/backgroundImage.dart';
import 'contributeBubble.dart';
import 'mainBubble.dart';
import 'settings/settingsPopupMenu.dart';
import 'statisticsBubble.dart';
import 'tabBarNavigation/tabBarNavigation.dart';

class Profile extends StatefulWidget {
  Profile(this.user);
  final User user;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isFollowing = true;

  Future<Null> _refreshProfile() async {}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshProfile, // TODO: call to fetch the profile
          child: ListView(
            children: <Widget>[
              Stack(children: <Widget>[
                Positioned(
                  top: 0,
                  child: BackgroundImage(
                    backgroundImage: widget.user.backgroundImage,
                    height: kBackgroundImageHeight,
                  ),
                ),
                widget.user.goBack
                    ? IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context))
                    : SizedBox(width: 0),
                Positioned(
                  top: 0,
                  right: 5,
                  child: SettingsPopupMenu(widget.user),
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                        height: kBackgroundImageHeight / 2 +
                            kBackgroundImageHeight / 5),
                    MainBubble(
                      name: widget.user.userName,
                      photoProfile: widget.user.photoProfile,
                      profession: widget.user.profession,
                      description: widget.user.description,
                      isFollowing: isFollowing,
                    ),
                    const SizedBox(height: kCommonSeparation),
                    StatisticsBubble(
                        uploads: 36, reproductions: 2000000, hearts: 128000),
                    const SizedBox(height: kCommonSeparation),
                    widget.user.contributeBubble
                        ? ContributeBubble(
                            contributeDescription:
                                widget.user.contributeDescription,
                          )
                        : SizedBox(width: 0),
                    const SizedBox(height: kHugeSeparation),
                    TabBarNavigation(posts: widget.user.posts),
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
