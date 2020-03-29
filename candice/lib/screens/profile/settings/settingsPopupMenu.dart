import 'package:candice/constants/texts.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:candice/models/user/user.dart';
import 'package:flutter/material.dart';

import 'aboutUs.dart';
import 'editProfile.dart';

class SettingsPopupMenu extends StatefulWidget {
  SettingsPopupMenu(this.user);
  final User user;

  @override
  _SettingsPopupMenuState createState() => _SettingsPopupMenuState();
}

class _SettingsPopupMenuState extends State<SettingsPopupMenu> {
  List<Widget> screenSettings;

  @override
  void initState() {
    screenSettings = [EditProfile(widget.user), AboutUs()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert, color: Colors.white),
      onSelected: (value) => Navigator.push(context,
          MaterialPageRoute(builder: (context) => screenSettings[value])),
      itemBuilder: (context) => [
        PopupMenuItem(
            child: Text(AppLocalizations.of(context).translate('editProfile')),
            value: kEditProfileValue),
        PopupMenuItem(
            child: Text(AppLocalizations.of(context).translate('aboutUs')),
            value: kAboutUsValue),
      ],
    );
  }
}
