import 'package:candice/common/profileImage.dart';
import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/appState.dart';
import 'package:candice/screens/home/story/storyDesign.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BubbleMessageDesign extends StatelessWidget {
  BubbleMessageDesign(
      {@required this.profilePic,
      @required this.userName,
      this.lastMessage = '',
      this.newMessages = 0,
      this.story = false});
  final String profilePic;
  final String userName;
  final String lastMessage;
  final int newMessages;
  final bool story;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(bottom: kSmallSeparation),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: kBorderRadiusSomeBorder),
        elevation: kElevation,
        child: Padding(
          padding: kPaddingCardMessages,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  story
                      ? StoryDesign(profilePic: profilePic, withPadding: false)
                      : PhotoProfile(
                          imageUrl: profilePic,
                          size: kSizePhotoProfileMessages,
                          action: () => goToUserProfile(context, appState, 1),
                        ),
                  const SizedBox(width: kCommonSeparation),
                  Container(
                    width: MediaQuery.of(context).size.width -
                        kSizePhotoProfileMessages -
                        kCommonSeparation * 3 -
                        kBigSeparation * 2 -
                        25 * 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userName,
                          style: kMediumBoldText,
                        ),
                        const SizedBox(height: kMediumSeparation),
                        Text(
                          lastMessage,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              newMessages > 0
                  ? ClipOval(
                      child: Container(
                        color: kPink,
                        height: 25.0,
                        width: 25.0,
                        child: Center(
                          child: Text(
                            newMessages.toString(),
                            style: kWhiteBoldText,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}
