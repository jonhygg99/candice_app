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
        child: ListView(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
          children: <Widget>[
            AddPostDesignButton(
              title: 'Create event', // TODO: translation
              color: kNeonBlue,
              action: () => print('Create event'),
            ),
            AddPostDesignButton(
              title: 'Request Group', // TODO: translation
              color: kNeonBlue,
              action: () => print('Request Group'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            AddPostDesignButton(
              title: 'Create Track', // TODO: translation
              color: kPink,
              action: () => print('Create track'),
            ),
            AddPostDesignButton(
              title: 'Upload track', // TODO: translation
              color: kPink,
              action: () => print('Upload Track'),
            ),
            AddPostDesignButton(
              title: 'Upload Video', // TODO: translation
              color: kPink,
              action: () => print('Upload Video'),
            ),
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
