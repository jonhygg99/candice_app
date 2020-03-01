import 'package:candice/common/profileImage.dart';
import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:flutter/material.dart';

class StoryDesign extends StatelessWidget {
  StoryDesign(this.profilePic);
  final String profilePic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kMediumSeparation / 2,
          top: kCommonSeparation,
          right: kMediumSeparation / 2,
          bottom: kCommonSeparation),
      child: InkWell(
        onTap: () => print('profile bubble tapped'),
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
