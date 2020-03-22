import 'package:candice/common/backgroundImage.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:flutter/material.dart';

class HotThisWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: kCommonSeparation,
      children: <Widget>[
        Text(AppLocalizations.of(context).translate('hotThisWeek'),
            style: kBigBoldText),
        HotThisWeekPostPreview()
      ],
    );
  }
}

class HotThisWeekPostPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map> hotBackgrounds = [
      {
        'backgroundImage':
            'https://images.unsplash.com/photo-1577644036183-94ce86392140?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1236&q=80',
        'song': 'Call me never',
        'profileName': 'Courtney Nguyen'
      },
      {
        'backgroundImage':
            'https://images.unsplash.com/photo-1546934469-0659d570f44e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
        'song': 'Black in the dark',
        'profileName': 'Wade Richards'
      },
      {
        'backgroundImage':
            'https://images.unsplash.com/photo-1577644036183-94ce86392140?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1236&q=80',
        'song': 'Blue is power',
        'profileName': 'Jake Richards'
      },
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: kSmallSeparation,
        children: buildHotThisWeekPostPreview(hotBackgrounds),
      ),
    );
  }

  List<Stack> buildHotThisWeekPostPreview(List<Map> hotBackgrounds) {
    List<Stack> widgets = [];

    hotBackgrounds.forEach((hot) {
      widgets.add(
        Stack(children: <Widget>[
          BackgroundImage(
            backgroundImage: hot['backgroundImage'],
            height: kSizePhotoHotThisWeek,
          ),
          Positioned(
            left: 10,
            bottom: 40,
            child: Container(
              width: kSizePhotoHotThisWeek - 15,
              child: Text(
                hot['song'],
                overflow: TextOverflow.ellipsis,
                style: kMediumWhiteBoldText,
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 15,
            child: Container(
              width: kSizePhotoHotThisWeek - 15,
              child: Text(
                hot['profileName'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ]),
      );
    });
    return widgets;
  }
}
