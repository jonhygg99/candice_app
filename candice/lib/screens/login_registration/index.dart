import 'package:candice/constants/colors.dart';
import 'package:candice/constants/enum.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:candice/screens/login_registration/registrationProcess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppRegistration extends StatefulWidget {
  AppRegistration({this.action});
  final Function action;
  @override
  _AppRegistrationState createState() => _AppRegistrationState();
}

class _AppRegistrationState extends State<AppRegistration> {
  VideoPlayerController _controller;
  Map<RegistrationProcessType, String> registrationMap = {
    RegistrationProcessType.Email: '',
    RegistrationProcessType.Username: '',
    RegistrationProcessType.Password: ''
  };
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
//    _controller = VideoPlayerController.asset('assets/sample/storySample.mp4');
//    _controller = VideoPlayerController.network(
//        'https://www.youtube.com/watch?v=9hGdmEwBwbg');
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
//    _controller.addListener(checkVideo);
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
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GestureDetector(
                  // TODO: remove
                  onTap: () => setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  AppLocalizations.of(context).translate('register'),
                  style: kMediumWhiteBoldText,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationProcess(
                        registrationProcess: RegistrationProcessType.Email,
                        registrationMap: registrationMap,
                        action: widget.action,
                      ),
                    ),
                  );
                },
                color: kPink,
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              const SizedBox(height: kSmallSeparation),
              FlatButton(
                child: Text(AppLocalizations.of(context).translate('logIn'),
                    style: kMediumWhiteBoldText),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationProcess(
                        registrationProcess: RegistrationProcessType.Email,
                        registrationMap: registrationMap,
                        action: widget.action,
                        isLogIn: true,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 45.0),
            ],
          ),
        ],
      ),
    );
  }
}
