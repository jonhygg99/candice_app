import 'package:candice/common/backgroundImage.dart';
import 'package:candice/common/bubbleSortDesign.dart';
import 'package:candice/common/searchTextField.dart';
import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

import 'bubbleSearchSort.dart';
import 'hotThisWeek.dart';

class Search extends StatelessWidget {
  Future<Null> _refreshSearch() async {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: RefreshIndicator(
            onRefresh: _refreshSearch, // TODO: call to fetch the search
            child: ListView(
              children: <Widget>[
                const SizedBox(height: kCommonSeparation),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kCommonSeparation),
                  child: SearchTextField(),
                ),
                BubbleSearchSort(),
                const SizedBox(height: kCommonSeparation),
                HomeSearch()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kCommonSeparation),
      child: Wrap(
        runSpacing: kCommonSeparation,
        children: <Widget>[HotThisWeek(), EventsNearYou()],
      ),
    );
  }
}

class EventsNearYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: kCommonSeparation,
      children: <Widget>[
        Text(
          AppLocalizations.of(context).translate('eventsNearYou'),
          style: kBigBoldText,
        ),
        Wrap(runSpacing: kTinySeparation, children: [
          EventCard(type: 'Concert', price: 8.95),
          EventCard(type: 'Jam session', price: 0),
          EventCard(type: 'Battle', price: 4.99),
        ]),
        Center(
            child: Text(AppLocalizations.of(context).translate('viewMore'),
                style: kMediumPinkBoldText))
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({@required this.type, this.price = 0.0});
  final String type;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kCommonSeparation),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: kBorderRadiusCircular),
        elevation: kElevation,
        child: Row(
          children: <Widget>[
            BackgroundImage(
              backgroundImage:
                  'https://images.unsplash.com/photo-1584029246365-f52f94406082?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1253&q=80',
              height: kSizePhotoEventsNearYou,
            ),
            Container(
              width: MediaQuery.of(context).size.width -
                  kSizePhotoEventsNearYou -
                  (kCommonSeparation * 2) -
                  kSmallSeparation,
              height: kSizePhotoEventsNearYou,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: kSmallSeparation,
                    top: kSmallSeparation,
                    child: BubbleSortDesign(
                      title: getTranslation(context),
                      color: getColor(),
                    ),
                  ),
                  Positioned(
                    left: kCommonSeparation,
                    top: kSizePhotoEventsNearYou / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Marvin Murphy', style: kMediumBoldText),
                        const SizedBox(height: kTinySeparation),
                        Row(
                          children: <Widget>[
                            Icon(Icons.location_on),
                            Text('Apolo, Barcelona')
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: kSmallSeparation,
                    bottom: kSmallSeparation,
                    child: BubbleSortDesign(
                      title: price == 0
                          ? AppLocalizations.of(context).translate('free')
                          : NumberFormat.compactCurrency(
                                  symbol: '€') // TODO: need to improve
                              .format(price),
                      color: kGrey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Color getColor() {
    if (type == 'Concert')
      return kGreen;
    else if (type == 'Jam session')
      return kPurple;
    else if (type == 'Battle')
      return kRed;
    else
      return kLightBlue;
  }

  String getTranslation(context) {
    if (type == 'Concert')
      return AppLocalizations.of(context).translate('concert');
    else if (type == 'Jam session')
      return AppLocalizations.of(context).translate('jamSession');
    else if (type == 'Battle')
      return AppLocalizations.of(context).translate('battle');
    else
      return 'Unkown';
  }
}

class ChewieListItem extends StatefulWidget {
  ChewieListItem({
    @required this.url,
    this.looping,
    Key key,
  }) : super(key: key);

  final String url;
  final bool looping;

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.asset('assets/sample/storySample.mp4');
//    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 1,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: widget.looping,
      allowMuting: true,
      autoPlay: true,
      showControlsOnInitialize: false,

      errorBuilder: (context, errorMessage) {
        return Center(
          // TODO: next video
          child: Icon(
            Icons.error,
            color: Colors.white,
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    // IMPORTANT to dispose of all the used resources
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
