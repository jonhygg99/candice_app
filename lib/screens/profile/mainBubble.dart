import 'package:candice/common/profileImage.dart';
import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:flutter/material.dart';

class MainBubble extends StatelessWidget {
  MainBubble(
      {this.name,
      this.photoProfile,
      this.profession,
      this.description,
      this.isFollowing});
  final String name;
  final String photoProfile;
  final String profession;
  final String description;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: kMarginCard,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: kBorderRadiusSomeBorder,
      ),
      elevation: kElevation,
      child: Padding(
        padding: kPaddingCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                PhotoProfile(imageUrl: photoProfile, size: kSizePhotoProfile),
                const SizedBox(width: kCommonSeparation),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.0),
                    ),
                    const SizedBox(height: kTinySeparation),
                    Text(
                      profession, // TODO: translation support
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: kRobotoBold),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: kMediumSeparation),
            Text(
              description,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: kBigSeparation),
            Row(
              children: <Widget>[
                ActionButton(
                    title: AppLocalizations.of(context).translate('playSongs'),
                    color: kLightBlue,
                    action: () {},
                    format: false),
                const SizedBox(width: kCommonSeparation),
                ActionButton(
                  title: isFollowing
                      ? AppLocalizations.of(context).translate('imFan')
                      : AppLocalizations.of(context).translate('beFan'),
                  color: kPink,
                  format: !isFollowing,
                  action: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  ActionButton({this.title, this.color, this.action, this.format});
  final String title;
  final Color color;
  final Function action;
  final bool format;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        child: Text(
          title,
          style: TextStyle(
              color: format ? color : Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        onPressed: action,
        color: format ? Colors.white : color,
        elevation: kElevation,
        padding: kPaddingButton,
        shape: RoundedRectangleBorder(
            borderRadius: kBorderRadiusSomeBorder,
            side: BorderSide(color: color, width: 4)),
      ),
    );
  }
}
