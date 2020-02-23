import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                StatisticsNumbers(number: uploads, title: kUploads),
                const SizedBox(width: kBigSeparation),
                StatisticsNumbers(number: reproductions, title: kReproductions),
                const SizedBox(width: kBigSeparation),
                StatisticsNumbers(number: hearts, title: kHearts),
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

class StatisticsNumbers extends StatelessWidget {
  StatisticsNumbers({this.number, this.title});
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
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2.0),
        Text(
          title,
          style: const TextStyle(fontSize: 14.0),
        )
      ],
    );
  }
}
