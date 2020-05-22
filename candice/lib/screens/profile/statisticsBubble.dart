import 'package:candice/common/numberFormat.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:candice/screens/profile/socialMediaBubbles.dart';
import 'package:flutter/material.dart';

class StatisticsBubble extends StatelessWidget {
  StatisticsBubble({this.uploads, this.reproductions, this.hearts});
  final int uploads;
  final int reproductions;
  final int hearts;
  final Map<String, String> socialMedia = {
    kWeb: 'http://candice-music.com',
    kYouTube: 'https://www.youtube.com/watch?v=WW7K3WWin_8',
    kInstagram: 'https://www.instagram.com/candicemusicoff/',
    kSpotify: 'https://open.spotify.com/artist/1rHf7vRCsDRBkbA1XGT9e1'
  };

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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StatisticsNumbers(
                    number: uploads,
                    title: AppLocalizations.of(context).translate('posts')),
                const SizedBox(width: kBigSeparation),
                StatisticsNumbers(
                    number: reproductions,
                    title: AppLocalizations.of(context)
                        .translate('reproductions')),
                const SizedBox(width: kBigSeparation),
                StatisticsNumbers(
                    number: hearts,
                    title: AppLocalizations.of(context).translate('hearts')),
              ],
            ),
            const SizedBox(height: kCommonSeparation),
            socialMedia.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildSocialMediaList(),
                  )
                : const SizedBox(height: 0.0),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSocialMediaList() {
    List<Widget> widgets = [];
    int i = 0;

    socialMedia.forEach((name, url) {
      ++i;
      widgets.add(
        SocialMediaBubbles(
          name: name,
          url: url,
        ),
      );
      if (i != socialMedia.length) widgets.add(const SizedBox(width: 10.0));
    });

    return widgets;
  }
}

class StatisticsNumbers extends StatelessWidget {
  StatisticsNumbers({this.number, this.title});
  final int number;
  final String title;

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
