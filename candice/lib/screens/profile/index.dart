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
          children: <Widget>[
            Stack(alignment: Alignment(0, 5.4), children: <Widget>[
              ProfileBackgroundImage(
                backgroundImage:
                    'https://images.unsplash.com/photo-1580331451062-99ff652288d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
              ),
              ProfileMainBubble(
                  name: 'Laia Montés',
                  photoProfile:
                      'https://images.unsplash.com/photo-1578680671705-0965e325b2ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1233&q=80',
                  profession: 'Singer and Guitarrist',
                  description:
                      'I’m a musician who loves Pop and Rock. 🤘 Currently studying for being a lawyer, but what I truly want is to sing in the shower.',
                  isFollowing: isFollowing)
            ]),
            const SizedBox(height: kCommonSeparation),
            StatisticsBubble(
                uploads: 36, reproductions: 2000000, hearts: 128000),
            const SizedBox(height: kCommonSeparation),
            ProfileContributeBubble(
              contributeDescription:
                  'Small steps every day will bring what I truly want! 😇',
            )
          ],
        ),
      ),
    );
  }
}

class ProfileContributeBubble extends StatelessWidget {
  ProfileContributeBubble({this.contributeDescription});
  final String contributeDescription;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: kMarginCard,
      shape: RoundedRectangleBorder(
        borderRadius: kBorderRadiusCircular,
      ),
      elevation: kElevation,
      child: Padding(
        padding: kPaddingCard,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                contributeDescription,
                style: const TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: kMediumSeparation),
              RaisedButton(
                elevation:
                    kElevation, // TODO: Is a Square elevation and should be with the button
                onPressed: () {},
                color: Colors.transparent,
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: 220,
                  child: Center(
                    child: const Text('Contribute',
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto-Bold',
                            fontWeight: FontWeight.bold)),
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: const LinearGradient(
                      colors: <Color>[kYellowGradient, kPinkGradient],
                    ),
                  ),
                  padding: const EdgeInsets.all(8.0),
                ),
              ),
            ]),
      ),
    );
  }
}

class ProfileBackgroundImage extends StatelessWidget {
  ProfileBackgroundImage({this.backgroundImage});
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: kRadiusCircular,
        bottomRight: kRadiusCircular,
      ),
      child: FittedBox(
        child: Image.network(backgroundImage,
            fit: BoxFit.fitWidth,
            height: 350,
            width: MediaQuery.of(context).size.width),
      ),
    );
  }
}

class StatisticsBubble extends StatelessWidget {
  StatisticsBubble({this.uploads, this.reproductions, this.hearts});
  final int uploads;
  final int reproductions;
  final int hearts;

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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ProfileStatistics(number: uploads, title: kUploads),
                const SizedBox(width: kBigSeparation),
                ProfileStatistics(number: reproductions, title: kReproductions),
                const SizedBox(width: kBigSeparation),
                ProfileStatistics(number: hearts, title: kHearts),
              ],
            ),
            const SizedBox(height: kCommonSeparation),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              SocialBubbles(
                icon: Icons.public,
                color: Colors.black,
                action: () {},
              )
            ]),
          ],
        ),
      ),
    );
  }
}

class SocialBubbles extends StatelessWidget {
  SocialBubbles({this.icon, this.color, this.action});
  final IconData icon;
  final Color color;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: kElevation,
      shape: CircleBorder(),
      child: InkWell(
        onTap: action,
        customBorder: CircleBorder(),
        child: IconButton(
          icon: Icon(
            icon,
            color: color,
          ),
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
      children: <Widget>[
        Text(
          numberFormat(number),
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2.0),
        Text(
          title,
          style: TextStyle(fontSize: 14.0),
        )
      ],
    );
  }
}

class ProfileMainBubble extends StatelessWidget {
  ProfileMainBubble(
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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(photoProfile),
                  radius: 40.0,
                  backgroundColor: kDefaultColorLoading,
                ),
                const SizedBox(width: kCommonSeparation),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.0),
                    ),
                    const SizedBox(height: kSmallSeparation),
                    Text(
                      profession,
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontFamily: kRobotoBold),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: kMediumSeparation),
            Text(
              description,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: kBigSeparation),
            Row(
              children: <Widget>[
                ActionButton(
                    title: kPlaySongs,
                    color: kLightBlue,
                    action: () {},
                    format: false),
                const SizedBox(width: kCommonSeparation),
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
