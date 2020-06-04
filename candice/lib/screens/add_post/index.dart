import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            AddPostDesignButton(
              title: 'Create event',
              color: kNeonBlue,
              action: () => print('Create event'),
            ),
            AddPostDesignButton(
              title: 'Request Group',
              color: kNeonBlue,
              action: () => print('Request Group'),
            ),
            const SizedBox(height: 80.0),
            AddPostDesignButton(
              title: 'Create Track',
              color: kPink,
              action: () => print('Create track'),
            ),
            AddPostDesignButton(
              title: 'Upload track',
              color: kPink,
              action: () => print('Upload Track'),
            ),
            AddPostDesignButton(
              title: 'Upload Video',
              color: kPink,
              action: () => print('Upload Video'),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}

class AddPostDesignButton extends StatelessWidget {
  AddPostDesignButton(
      {@required this.title, @required this.color, this.action});
  final String title;
  final Color color;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 50.0, vertical: kSmallSeparation),
      child: InkWell(
        borderRadius: BorderRadius.all(kBorderRadiusCircle),
        onTap: action,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: kPaddingBubbleAddPost,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: 3, color: color),
              borderRadius: BorderRadius.all(kBorderRadiusCircle)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Text(
                title,
                style: kBigWhiteBoldText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
