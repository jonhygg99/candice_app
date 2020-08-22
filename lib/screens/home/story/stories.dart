import 'package:flutter/material.dart';

import 'addStory.dart';
import 'peopleStories.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          AddStory(),
          PeopleStories(),
        ],
      ),
    );
  }
}
