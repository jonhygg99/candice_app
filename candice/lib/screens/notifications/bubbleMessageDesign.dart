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
        shape: RoundedRectangleBorder(borderRadius: kBorderRadiusCircular),
        elevation: kElevation,
        child: Padding(
          padding: kPaddingCardMessages,
          child: Row(
            children: <Widget>[
              story
                  ? StoryDesign(profilePic: profilePic, withPadding: false)
                  : PhotoProfile(
                      imageUrl: profilePic,
                      size: kSizePhotoProfileMessages,
                      action: () => goToUserProfile(context, appState, 1),
                    ),
              const SizedBox(width: kCommonSeparation),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: kRobotoBold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: kMediumSeparation),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 +
                        MediaQuery.of(context).size.width / 12,
                    child: Text(
                      lastMessage,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              newMessages > 0
                  ? ClipOval(
                      child: Container(
                        color: kPink,
                        height: 25.0, // height of the button
                        width: 25.0, // width of the button
                        child: Center(
                          child: Text(
                            newMessages.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: kRobotoBold,
                                fontWeight: FontWeight.bold),
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
