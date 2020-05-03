import 'package:candice/constants/measures.dart';
import 'package:flutter/material.dart';

import 'eventsNearYou.dart';
import 'hotThisWeek.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: kCommonSeparation,
      children: <Widget>[
        HotThisWeek(),
        Padding(
          padding: const EdgeInsets.only(left: kCommonSeparation),
          child: EventsNearYou(),
        )
      ],
    );
  }
}
