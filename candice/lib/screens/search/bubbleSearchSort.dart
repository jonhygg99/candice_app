import 'package:candice/common/bubbleSortDesign.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/models/appState.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:candice/models/enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BubbleSearchSort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(top: kCommonSeparation),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            const SizedBox(width: kCommonSeparation),
            BubbleSortDesign(
              title: AppLocalizations.of(context).translate('home'),
              action: () =>
                  appState.reverseSearchBubbleState(SearchBubble.Home),
              active: appState.searchBubbleState[SearchBubble.Home],
            ),
            BubbleSortDesign(
              title: AppLocalizations.of(context).translate('trendingArtists'),
              action: () => appState
                  .reverseSearchBubbleState(SearchBubble.TrendingArtists),
              active: appState.searchBubbleState[SearchBubble.TrendingArtists],
            ),
            BubbleSortDesign(
              title: AppLocalizations.of(context).translate('events'),
              action: () =>
                  appState.reverseSearchBubbleState(SearchBubble.Events),
              active: appState.searchBubbleState[SearchBubble.Events],
            ),
            BubbleSortDesign(
              title: AppLocalizations.of(context).translate('castings'),
              action: () =>
                  appState.reverseSearchBubbleState(SearchBubble.Castings),
              active: appState.searchBubbleState[SearchBubble.Castings],
            ),
          ],
        ),
      ),
    );
  }
}
