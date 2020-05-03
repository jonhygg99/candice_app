import 'package:candice/common/bubbleSortDesign.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/models/appState.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:candice/models/enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BubbleSearchSort extends StatelessWidget {
  BubbleSearchSort({this.index, this.action});
  final int index;
  final Function action;

  final Map<String, SearchBubble> searchBubbleList = {
    'home': SearchBubble.Home,
    'trendingArtists': SearchBubble.TrendingArtists,
    'events': SearchBubble.Events,
    'castings': SearchBubble.Castings
  };

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(top: kCommonSeparation),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: buildBubbleList(context, appState)),
      ),
    );
  }

  List<Widget> buildBubbleList(context, appState) {
    List<Widget> bubbleList = [const SizedBox(width: kCommonSeparation)];

    searchBubbleList.forEach((key, value) {
      bubbleList.add(
        BubbleSortDesign(
          title: AppLocalizations.of(context).translate(key),
          action: () => action(value.index),
          active: value.index == index,
        ),
      );
    });
    return bubbleList;
  }
}
