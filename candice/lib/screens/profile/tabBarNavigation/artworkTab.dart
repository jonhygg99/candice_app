import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/appState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../backgroundImage.dart';

class ArtworkTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            PostPreview(
              backgroundImage:
                  'https://images.unsplash.com/photo-1581289098325-fd41f57a9d4e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1601&q=80',
              postTitle: 'Break my soul',
            ),
            const SizedBox(width: kSmallSeparation),
            PostPreview(
              backgroundImage:
                  'https://images.unsplash.com/photo-1581289098325-fd41f57a9d4e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1601&q=80',
              postTitle: 'Break my soul',
            ),
          ],
        ),
        const SizedBox(height: kSmallSeparation),
        Row(
          children: <Widget>[
            PostPreview(
              backgroundImage:
                  'https://images.unsplash.com/photo-1581289098325-fd41f57a9d4e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1601&q=80',
              postTitle: 'Break my soul',
            ),
            const SizedBox(width: kSmallSeparation),
          ],
        ),
      ],
    );
  }
}

class PostPreview extends StatelessWidget {
//  const PostPreview({
//    Key key,
//  }) : super(key: key);
  PostPreview({this.backgroundImage, this.postTitle});
  final String backgroundImage;
  final String postTitle;
  // TODO: Audio/Video

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Stack(
      children: <Widget>[
        BackgroundImage(
            backgroundImage: backgroundImage,
            height: kPostPreviewBackgroundImageHeight),
        Positioned(
          bottom: 12,
          left: 12,
          child: Text(postTitle, style: kWhiteBoldText),
        ),
        Positioned(
          top: kPostPreviewBackgroundImageHeight / 4,
          left: MediaQuery.of(context).size.width / 6 -
              (kMediumSeparation +
                  kMediumSeparation), // Depends on the BackgroundImage widget, the width and height
          child: Opacity(
            opacity: 0.75,
            child: IconButton(
              icon: Icon(
                  Icons.play_circle_filled /*: Icons.pause_circle_filled */),
              iconSize: 70,
              color: Colors.white,
              onPressed: appState.showMusicTabAndPlay,
            ),
          ),
        ),
      ],
    );
  }
}
