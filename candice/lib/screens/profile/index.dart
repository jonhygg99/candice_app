import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isFollowing = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Stack(alignment: Alignment(0, 5.4), children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: kRadiusCircular,
                  bottomRight: kRadiusCircular,
                ),
                child: FittedBox(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1580331451062-99ff652288d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
                    fit: BoxFit.fitWidth,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              ProfileBubble(
                  name: 'Laia Montés',
                  photoProfile:
                      'https://images.unsplash.com/photo-1578680671705-0965e325b2ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1233&q=80',
                  profession: 'Singer and Guitarrist',
                  description:
                      'I’m a musician who loves Pop and Rock. 🤘 Currently studying for being a lawyer, but what I truly want is to sing in the shower.',
                  isFollowing: isFollowing)
            ]),
            Card(
                margin: kMarginCard,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: kBorderRadiusCircular,
                ),
                elevation: kElevation,
                child: Padding(
                    padding: kPaddingCard,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfileStatistics(number: 36, title: kUploads),
                            SizedBox(width: kBigSeparation),
                            ProfileStatistics(
                                number: 2000000, title: kReproductions),
                            SizedBox(width: kBigSeparation),
                            ProfileStatistics(number: 128000, title: kHearts),
                          ],
                        ),
                        Row()
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

class ProfileStatistics extends StatelessWidget {
  ProfileStatistics({this.number, this.title});
  final int number;
  final String title;

  String numberFormat(int nb) {
    return NumberFormat.compact().format(nb);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          numberFormat(number),
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2.0),
        Text(
          title,
          style: TextStyle(fontSize: 14.0),
        )
      ],
    );
  }
}

class ProfileBubble extends StatelessWidget {
  ProfileBubble(
      {this.name,
      this.photoProfile,
      this.profession,
      this.description,
      this.isFollowing});
  final String name;
  final String photoProfile;
  final String profession;
  final String description;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: kMarginCard,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: kBorderRadiusCircular,
      ),
      elevation: kElevation,
      child: Padding(
        padding: kPaddingCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(photoProfile),
                  radius: 40.0,
                ),
                SizedBox(width: kCommonSeparation),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.0),
                    ),
                    SizedBox(height: kSmallSeparation),
                    Text(
                      profession,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontFamily: kRobotoBold),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: kMediumSeparation),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: kBigSeparation),
            Row(
              children: [
                ActionButton(
                    title: kPlaySongs,
                    color: kLightBlue,
                    action: () {},
                    format: false),
                SizedBox(width: kCommonSeparation),
                ActionButton(
                  title: isFollowing ? kImFan : kBeFan,
                  color: kPink,
                  format: !isFollowing,
                  action: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  ActionButton({this.title, this.color, this.action, this.format});
  final String title;
  final Color color;
  final Function action;
  final bool format;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        child: Text(
          title,
          style: TextStyle(
              color: format ? color : Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        onPressed: action,
        color: format ? Colors.white : color,
        elevation: kElevation,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
            borderRadius: kBorderRadiusCircular,
            side: BorderSide(color: color, width: 4)),
      ),
    );
  }
}
