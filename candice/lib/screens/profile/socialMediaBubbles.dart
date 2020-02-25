import 'dart:io';

import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class SocialMediaBubbles extends StatelessWidget {
  SocialMediaBubbles({this.name, this.url});
  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: kElevation,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        child: IconButton(
          icon: _getIcon(name),
        ),
        onTap: () {
          try {
            if (Platform.isIOS || Platform.isAndroid)
              _launchURLInMobile(url);
            else
              _launchURLInWeb(url);
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }

  Icon _getIcon(String name) {
    switch (name) {
      case kInstagram:
        return const Icon(CommunityMaterialIcons.instagram, color: Colors.pink);
      case kFacebook:
        return const Icon(CommunityMaterialIcons.facebook,
            color: Colors.blueAccent);
      case kSoundCloud:
        return const Icon(CommunityMaterialIcons.soundcloud,
            color: Colors.orange);
      case kSpotify:
        return const Icon(CommunityMaterialIcons.spotify, color: Colors.green);
      case kSnapchat:
        return const Icon(CommunityMaterialIcons.snapchat,
            color: Colors.orangeAccent);
//      case kTikTok:
//        return const Icon(CommunityMaterialIcons.music, color: Colors.black); // TODO: TikTok logo
      case kTwitter:
        return const Icon(CommunityMaterialIcons.twitter,
            color: Colors.lightBlue);
      case kWeb:
        return const Icon(Icons.public, color: Colors.black);
      case kYouTube:
        return const Icon(CommunityMaterialIcons.youtube, color: Colors.red);
      default:
        return const Icon(Icons.public, color: Colors.black);
    }
  }

  _launchURLInMobile(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchURLInWeb(String url) {
    html.window.open(url, '');
  }
}
