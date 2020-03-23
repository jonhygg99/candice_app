import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StoryVideoPostDesign extends StatefulWidget {
  @override
  _StoryVideoPostDesignState createState() => _StoryVideoPostDesignState();
}

class _StoryVideoPostDesignState extends State<StoryVideoPostDesign> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/sample/storySample.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
//    _controller.setVolume(0.0);
    _controller.setLooping(false);
    _controller.addListener(checkVideo);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the correct icon depending on the state of the player.
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GestureDetector(
                  onTap: () => setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      // If the video is paused, play it.
                      _controller.play();
                    }
                  }),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                ); // TODO: change
              }
            },
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => print('back'),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkVideo() {
    if (_controller.value.position == _controller.value.duration)
      Navigator.pop(context);
  }
}
