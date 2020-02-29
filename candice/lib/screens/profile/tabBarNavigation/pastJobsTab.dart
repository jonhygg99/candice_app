import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/material.dart';

class PastJobsTab extends StatelessWidget {
  static const List<double> starList = [3.5, 4, 5, 4, 3, 5];
  final int reviewsCount = starList.length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: _buildStars(4.5)),
            const SizedBox(width: kMediumSeparation),
            Text(
              reviewsCount > 1
                  ? '$reviewsCount reviews'
                  : '$reviewsCount review',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontFamily: kRobotoBold),
            )
          ],
        ),
        const SizedBox(height: kCommonSeparation),
        Card(
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
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1578680671705-0965e325b2ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1233&q=80'),
                      radius: 30.0,
                      backgroundColor: kDefaultColorLoading,
                    ),
                    const SizedBox(width: kCommonSeparation),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Kathryn Cooper',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        const SizedBox(height: kTinySeparation),
                        Row(
                          children: _buildStars(starList[0]),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: kMediumSeparation),
                Text(
                  'Est est tempor sit commodo dolore sit commodo Lorem in nulla cillum ex magna adipisicing consectetur elit',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  List<Icon> _buildStars(double nb) {
    List<Icon> stars = [];

    for (int i = 0; i < 5; ++i) {
      if (nb - 1 >= 0) {
        --nb;
        stars.add(const Icon(Icons.star, color: Colors.pink));
      } else if (nb - 0.5 >= 0) {
        nb -= 0.5;
        stars.add(const Icon(Icons.star_half, color: Colors.pink));
      } else if (nb > 0.25) {
        nb = 0;
        stars.add(const Icon(Icons.star_half, color: Colors.pink));
      } else {
        nb = 0;
        stars.add(const Icon(Icons.star_border, color: Colors.pink));
      }
    }
    return stars;
  }
}
