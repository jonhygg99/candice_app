import 'package:candice/common/profileImage.dart';
import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:flutter/material.dart';

import 'StoryVideoPostDesign.dart';

class StoryDesign extends StatelessWidget {
  StoryDesign({@required this.profilePic, this.withPadding = false});
  final String profilePic;
  final bool withPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: withPadding
          ? const EdgeInsets.only(
              left: kMediumSeparation / 2,
              top: kCommonSeparation,
              right: kMediumSeparation / 2,
              bottom: kCommonSeparation)
          : const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StoryVideoPostDesign()),
        ),
        borderRadius: BorderRadius.all(Radius.circular(35.0)),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kLightPink, width: 3)),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.transparent, width: 2)),
            child: PhotoProfile(
              imageUrl: profilePic,
              size: kSizePhotoProfileStory,
            ),
          ),
        ),
      ),
    );
  }
}
