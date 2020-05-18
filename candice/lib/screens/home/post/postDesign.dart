import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:candice/common/backgroundImage.dart';
import 'package:candice/common/numberFormat.dart';
import 'package:candice/common/profileImage.dart';
import 'package:candice/constants/icons.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/appState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingPost,
      child: Material(
        borderRadius: BorderRadius.all(kRadiusCircular),
        elevation: kElevation,
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            MusicInteractions(),
            PostProfile(),
          ],
        ),
      ),
    );
  }
}

class MusicInteractions extends StatefulWidget {
  @override
  _MusicInteractionsState createState() => _MusicInteractionsState();
}

class _MusicInteractionsState extends State<MusicInteractions> {
  bool isFirstTime = true;
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    _assetsAudioPlayer.open(
      Audio('assets/sample/audioSample.mp3'),
      autoStart: false,
    );
    _subscriptions.add(_assetsAudioPlayer.playlistFinished.listen((data) {
      print("finished : $data");
    }));
    _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print("playlistAudioFinished : $data");
    }));
    _subscriptions.add(_assetsAudioPlayer.current.listen((data) {
      print("current : $data");
    }));
    _subscriptions.add(_assetsAudioPlayer.onReadyToPlay.listen((audio) {
      print("onRedayToPlay : $audio");
    }));

    super.initState();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgroundImage(
          imageUrl:
              'https://images.unsplash.com/photo-1581289098325-fd41f57a9d4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1301&q=80',
          height: kPostBackgroundImageHeight,
        ),
        Positioned(
          top: kCommonSeparation,
          left: kCommonSeparation,
          child: Text(
            'Break my soul',
            style: kBigWhiteBoldText,
          ),
        ),
        StreamBuilder(
            stream: _assetsAudioPlayer.current,
            builder: (context, snapshot) {
              final Playing playing = snapshot.data;
              final bool isPlaying = _assetsAudioPlayer.isPlaying.value;
              return Positioned(
                top: kPostBackgroundImageHeight / 2 - 50,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: Opacity(
                  opacity: kOpacity,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _assetsAudioPlayer.playOrPause();
                      });
                    },
                    child: Icon(
                      isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_filled,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
              );
            }),
        Positioned(
          bottom: kSmallSeparation,
          right: kSmallSeparation,
          child: Container(
            height: 30.0,
            child: Row(
              children: <Widget>[
                BubblePost(
                  icon: kCommentIcon,
                  number: 212,
                  action: () => print('Comment post'),
                ),
                const SizedBox(width: kSmallSeparation),
                BubblePost(
                  icon: kLikeIcon,
                  number: 2032,
                  action: () => print('Liked post'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PostProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Container(
      height: 90.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            bottomLeft: kRadiusCircular, bottomRight: kRadiusCircular),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kMediumSeparation,
          vertical: kSmallSeparation,
        ),
        child: Row(
          children: <Widget>[
            PhotoProfile(
              imageUrl:
                  'https://images.unsplash.com/photo-1536896407451-6e3dd976edd1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
              size: kSizePhotoProfileStory,
              action: () => goToUserProfile(context, appState, '1'),
            ),
            const SizedBox(width: kCommonSeparation),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  child: Text(
                    'Julie Howard',
                    style: kMediumBoldText,
                  ),
                  onTap: () => goToUserProfile(context, appState, '1'),
                ),
                const SizedBox(height: kSmallSeparation),
                Text(
                  '42 min ago', // TODO: time - time and translation support
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BubblePost extends StatelessWidget {
  BubblePost({@required this.icon, @required this.number, this.action});
  final Icon icon;
  final int number;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: action,
      color: Colors.grey.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Row(
        children: <Widget>[
          icon,
          const SizedBox(width: kTinySeparation),
          Text(
            numberFormat(number),
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
