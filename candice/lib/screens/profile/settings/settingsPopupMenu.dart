import 'package:candice/constants/texts.dart';
import 'package:flutter/material.dart';

class SettingsPopupMenu extends StatelessWidget {
  const SettingsPopupMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert, color: Colors.white),
      onSelected: (value) => Navigator.push(context,
          MaterialPageRoute(builder: (context) => kScreenSettings[value])),
      itemBuilder: (context) => [
        PopupMenuItem(child: Text(kEditProfile), value: kEditProfileValue),
        PopupMenuItem(child: Text(kAboutUs), value: kAboutUsValue),
      ],
    );
  }
}
