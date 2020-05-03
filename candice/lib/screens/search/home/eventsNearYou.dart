import 'package:candice/common/backgroundImage.dart';
import 'package:candice/common/bubbleSortDesign.dart';
import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventsNearYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: kCommonSeparation,
      children: <Widget>[
        Text(
          AppLocalizations.of(context).translate('eventsNearYou'),
          style: kBigBoldText,
        ),
        Wrap(runSpacing: kTinySeparation, children: [
          EventCard(type: 'Concert', price: 8.95),
          EventCard(type: 'Jam session', price: 0),
          EventCard(type: 'Battle', price: 4.99),
        ]),
        Center(
            child: Text(AppLocalizations.of(context).translate('viewMore'),
                style: kMediumPinkBoldText))
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({@required this.type, this.price = 0.0});
  final String type;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kCommonSeparation),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: kBorderRadiusCircular),
        elevation: kElevation,
        child: Row(
          children: <Widget>[
            BackgroundImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1584029246365-f52f94406082?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1253&q=80',
              height: kSizePhotoEventsNearYou,
            ),
            Container(
              width: MediaQuery.of(context).size.width -
                  kSizePhotoEventsNearYou -
                  (kCommonSeparation * 2) -
                  kSmallSeparation,
              height: kSizePhotoEventsNearYou,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: kSmallSeparation,
                    top: kSmallSeparation,
                    child: BubbleSortDesign(
                      title: _getTranslation(context),
                      color: _getColor(),
                    ),
                  ),
                  Positioned(
                    left: kCommonSeparation,
                    top: kSizePhotoEventsNearYou / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Marvin Murphy', style: kMediumBoldText),
                        const SizedBox(height: kTinySeparation),
                        Row(
                          children: <Widget>[
                            Icon(Icons.location_on),
                            Text('Apolo, Barcelona')
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: kSmallSeparation,
                    bottom: kSmallSeparation,
                    child: BubbleSortDesign(
                      title: price == 0
                          ? AppLocalizations.of(context).translate('free')
                          : NumberFormat.compactCurrency(
                                  symbol: '€') // TODO: need to improve
                              .format(price),
                      color: kGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor() {
    if (type == 'Concert')
      return kGreen;
    else if (type == 'Jam session')
      return kPurple;
    else if (type == 'Battle')
      return kRed;
    else
      return kLightBlue;
  }

  String _getTranslation(context) {
    if (type == 'Concert')
      return AppLocalizations.of(context).translate('concert');
    else if (type == 'Jam session')
      return AppLocalizations.of(context).translate('jamSession');
    else if (type == 'Battle')
      return AppLocalizations.of(context).translate('battle');
    else
      return 'Unkown';
  }
}
