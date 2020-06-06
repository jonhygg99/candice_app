import 'package:flutter/material.dart';

const int kCommentMaxLength = 255;
// STYLE
const double kRadius = 12.0;
const double kElevation = 5.0;
const double kOpacity = 0.75;

// Separation
//const double kGiantSeparation = 35.0;
const double kHugeSeparation = 30.0;
const double kBigSeparation = 25.0;
const double kCommonSeparation = 20.0;
const double kMediumSeparation = 15.0;
const double kSmallSeparation = 10.0;
const double kTinySeparation = 5.0;
const double kTabBarSeparation = 40.0;

// Image size
const double kSizePhotoProfile = 80.0;
const double kSizePhotoProfileStory = 70.0;
const double kSizePhotoHotThisWeek = 180.0;
const double kSizePhotoEventsNearYou = 150.0;
const double kSizePhotoProfileReviews = 70.0;
const double kSizePhotoProfileMessages = 70.0;
const double kSizeEditBackgroundImage = 160.0;
const double kBackgroundImageHeight = 350.0;
const double kPostPreviewBackgroundImageHeight = 200.0;
const double kPostTrendingArtistSize = 370.0;
const double kPostEventSearchHeight = 250.0;
const double kPostBackgroundImageHeight = 400.0;

// Icon Button
const double kIconButtonSize = 40.0;
// Radius
const Radius kRadiusCircular = Radius.circular(kRadius);
BorderRadius kBorderRadiusSomeBorder = BorderRadius.circular(kRadius);
BorderRadius kBorderRadiusCircular = BorderRadius.circular(50);
const Radius kBorderRadiusCircle = Radius.circular(50);

// Padding
const EdgeInsets kPaddingPost = EdgeInsets.symmetric(
    horizontal: kMediumSeparation, vertical: kBigSeparation / 2);
const EdgeInsets kPaddingCard = EdgeInsets.symmetric(
    horizontal: kBigSeparation, vertical: kCommonSeparation);
const EdgeInsets kPaddingCardMessages = EdgeInsets.symmetric(
    horizontal: kCommonSeparation, vertical: kMediumSeparation);
const EdgeInsets kPaddingTabBar =
    EdgeInsets.symmetric(horizontal: kBigSeparation);
const EdgeInsets kPaddingButton =
    EdgeInsets.symmetric(horizontal: kCommonSeparation, vertical: 8.0);
const EdgeInsets kPaddingBubbleNotificationSort = EdgeInsets.symmetric(
    horizontal: kCommonSeparation, vertical: kTinySeparation);
const EdgeInsets kPaddingBubbleAddPost = EdgeInsets.symmetric(
    horizontal: kCommonSeparation, vertical: kTinySeparation);
const EdgeInsets kPaddingAddStory = EdgeInsets.only(
  left: kBigSeparation,
  top: 0,
  right: kMediumSeparation / 2,
  bottom: kCommonSeparation,
);
const EdgeInsets kPaddingPeopleStory = EdgeInsets.only(
  left: kMediumSeparation / 2,
  top: 0,
  right: kMediumSeparation / 2,
  bottom: kCommonSeparation,
);

// Margin
const kMarginCard = EdgeInsets.symmetric(horizontal: kMediumSeparation);
