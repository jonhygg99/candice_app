import 'package:candice/common/backgroundImage.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'bubbleSearchSort.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: <Widget>[
              BubbleSearchSort(),
              const SizedBox(height: kCommonSeparation),
              HomeSearch()
            ],
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
        children: <Widget>[HotThisWeek(), Text('No move please')],
      ),
    );
  }
}

class HotThisWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Hot this week', style: kBigBoldText),
        const SizedBox(height: kCommonSeparation),
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
      widgets.add(Stack(children: <Widget>[
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
        )
      ]));
    });
    return widgets;
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
