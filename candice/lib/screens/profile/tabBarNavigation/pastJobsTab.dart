import 'package:candice/common/profileImage.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/appState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ReviewDesign(),
      ],
    );
  }
}

class ReviewDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Card(
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
                PhotoProfile(
                  imageUrl:
                      'https://images.unsplash.com/photo-1582786769327-58d97354cd31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
                  size: kSizePhotoProfileReviews,
                  action: () => goToUserProfile(context, appState, '1'),
                ),
                const SizedBox(width: kCommonSeparation),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () => goToUserProfile(context, appState, '1'),
                      child: Text(
                        'Kathryn Cooper',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(height: kTinySeparation),
                    Row(
                      children: _buildStars(3.5),
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
    );
  }
}

List<Icon> _buildStars(double nb) {
  List<Icon> stars = [];

  for (int i = 0; i < 5; ++i) {
    if (nb - 1 >= 0) {
      --nb;
      stars.add(const Icon(Icons.star, color: Colors.pink));
    } else if (nb > 0.25) {
      nb -= 0.5;
      stars.add(const Icon(Icons.star_half, color: Colors.pink));
    } else {
      stars.add(const Icon(Icons.star_border, color: Colors.pink));
    }
  }
  return stars;
}
