import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: Center(child: Text('Search')));
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
