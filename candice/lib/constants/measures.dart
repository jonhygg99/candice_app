import 'package:flutter/material.dart';

const int kCommentMaxLength = 255;
// STYLE
const double kRadius = 12.0;
const double kElevation = 10.0;
const double kOpacity = 0.75;
//const double kGiantSeparation = 35.0;
const double kHugeSeparation = 30.0;
const double kBigSeparation = 25.0;
const double kCommonSeparation = 20.0;
const double kMediumSeparation = 15.0;
const double kSmallSeparation = 10.0;
const double kTinySeparation = 5.0;
const double kTabBarSeparation = 40.0;

const Radius kRadiusCircular = Radius.circular(kRadius);
BorderRadius kBorderRadiusCircular = BorderRadius.circular(kRadius);
const EdgeInsets kPaddingPost = EdgeInsets.symmetric(
    horizontal: kMediumSeparation, vertical: kBigSeparation / 2);
const EdgeInsets kPaddingCard = EdgeInsets.symmetric(
    horizontal: kBigSeparation, vertical: kCommonSeparation);
const EdgeInsets kPaddingTabBar =
    EdgeInsets.symmetric(horizontal: kBigSeparation);
const EdgeInsets kPaddingButton =
    EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0);
const EdgeInsets kPaddingStory = const EdgeInsets.only(
    left: kBigSeparation,
    top: kCommonSeparation,
    right: kMediumSeparation / 2,
    bottom: kCommonSeparation);
const kMarginCard = EdgeInsets.symmetric(horizontal: kMediumSeparation);

// Profile
const double kBackgroundImageHeight = 350.0;
const double kPostPreviewBackgroundImageHeight = 200.0;
const double kPostBackgroundImageHeight = 400.0;
