import 'package:candice/screens/profile/settings/aboutUs.dart';
import 'package:candice/screens/profile/settings/editProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// PROFILE SCREEN
// PopupMenuButton
const String kEditProfile = 'Edit profile';
const int kEditProfileValue = 0;
const String kAboutUs = 'About us';
const int kAboutUsValue = 1;
List<Widget> kScreenSettings = [EditProfile(), AboutUs()];

//Social Media
const String kFacebook = 'Facebook';
const String kInstagram = 'Instagram';
const String kSoundCloud = 'SoundCloud';
const String kSpotify = 'Spotify';
const String kSnapchat = 'Snapchat';
//const String kTikTok = 'TikTok'; // TODO: TikTok logo
const String kTwitter = 'Twitter';
const String kWeb = 'Web';
const String kYouTube = 'YouTube';
// Action Buttons
const String kPlaySongs = 'Play songs';
const String kImFan = 'I\'m fan';
const String kBeFan = 'Be fan';
