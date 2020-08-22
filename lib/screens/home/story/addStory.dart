import 'package:candice/common/profileImage.dart';
import 'package:candice/constants/measures.dart';
import 'package:flutter/material.dart';

class AddStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAddStory,
      child: InkWell(
        onTap: () => print('profile bubble tapped'),
        borderRadius: BorderRadius.all(Radius.circular(35.0)),
        child: Stack(
          children: <Widget>[
            PhotoProfile(
                imageUrl:
                    'https://images.unsplash.com/photo-1578680671705-0965e325b2ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1233&q=80',
                size: kSizePhotoProfileStory),
            Positioned(
              right: -1.0,
              bottom: 0,
              child: Icon(Icons.add_circle, color: Colors.pinkAccent),
            )
          ],
        ),
      ),
    );
  }
}
