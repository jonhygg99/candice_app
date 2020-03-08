import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/user/post.dart';
import 'package:flutter/material.dart';

import '../../../common/backgroundImage.dart';

class ArtworkTab extends StatelessWidget {
  ArtworkTab(this.posts);
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _buildPosts() ?? Text('This user hasn\'t upload any post'));
  }

  List<Widget> _buildPosts() {
    List<Widget> widgets = [];

    for (int i = 0; i < posts.length; ++i) {
      if (i + 1 < posts.length) {
        widgets.add(Row(
          children: <Widget>[
            PostPreviewDesign(
              title: posts[i].title,
              backgroundImage: posts[i].backgroundImage,
            ),
            const SizedBox(width: kSmallSeparation),
            PostPreviewDesign(
              title: posts[i + 1].title,
              backgroundImage: posts[i + 1].backgroundImage,
            )
          ],
        ));
        ++i;
      } else {
        widgets.add(
          Row(
            children: <Widget>[
              PostPreviewDesign(
                title: posts[i].title,
                backgroundImage: posts[i].backgroundImage,
              ),
            ],
          ),
        );
      }
      widgets.add(const SizedBox(height: kSmallSeparation));
    }
    return widgets;
  }
}

class PostPreviewDesign extends StatelessWidget {
  PostPreviewDesign({@required this.backgroundImage, @required this.title});
  final String backgroundImage;
  final String title;
  // TODO: Audio/Video

  @override
  Widget build(BuildContext context) {
//    final appState = Provider.of<AppState>(context);

    return Stack(
      children: <Widget>[
        BackgroundImage(
            backgroundImage: backgroundImage,
            height: kPostPreviewBackgroundImageHeight),
        Positioned(
          bottom: 12,
          left: 12,
          child: Text(title, style: kWhiteBoldText),
        ),
        Positioned(
          top: kPostPreviewBackgroundImageHeight / 4,
          left: MediaQuery.of(context).size.width / 6 -
              (kMediumSeparation +
                  kMediumSeparation), // Depends on the BackgroundImage widget, the width and height
          child: Opacity(
            opacity: kOpacity,
            child: IconButton(
              icon: Icon(
                  Icons.play_circle_filled /*: Icons.pause_circle_filled */),
              iconSize: 70,
              color: Colors.white,
              onPressed: () => print('playing song'),
            ),
          ),
        ),
      ],
    );
  }
}
