import 'package:candice/common/backgroundImage.dart';
import 'package:candice/common/bubbleSortDesign.dart';
import 'package:candice/constants/colors.dart';
import 'package:candice/constants/enum.dart';
import 'package:candice/constants/icons.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kCommonSeparation),
      child: Wrap(
        runSpacing: kMediumSeparation,
        children: <Widget>[
          EventCard(type: EventType.Concert),
          EventCard(type: EventType.JamSession),
          EventCard(type: EventType.Battle),
          EventCard(type: EventType.Concert),
          Container()
        ],
      ),
    );
  }
}

class EventCard extends StatefulWidget {
  const EventCard({@required this.type});
  final EventType type;

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgroundImage(
          height: kPostEventSearchHeight,
          imageUrl:
              'https://images.unsplash.com/photo-1524368535928-5b5e00ddc76b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
        ),
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
          bottom: kSmallSeparation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Marvin Murphy', style: kBigWhiteBoldText),
              const SizedBox(height: kTinySeparation),
              Row(
                children: <Widget>[
                  const Icon(Icons.location_on, color: Colors.white),
                  const SizedBox(width: kTinySeparation),
                  Text('Apolo, Barcelona', style: kWhiteBoldText)
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: kCommonSeparation,
          bottom: kMediumSeparation,
          child: InkWell(
            child: isLike ? kLikeIcon : kNotLikeIcon,
            onTap: () => setState(() {
              this.isLike = !isLike;
            }),
          ),
        ),
      ],
    );
  }

  Color _getColor() {
    if (widget.type == EventType.Concert)
      return kGreen;
    else if (widget.type == EventType.JamSession)
      return kPurple;
    else if (widget.type == EventType.Battle)
      return kRed;
    else
      return kLightBlue;
  }

  String _getTranslation(context) {
    if (widget.type == EventType.Concert)
      return AppLocalizations.of(context).translate('concert');
    else if (widget.type == EventType.JamSession)
      return AppLocalizations.of(context).translate('jamSession');
    else if (widget.type == EventType.Battle)
      return AppLocalizations.of(context).translate('battle');
    else
      return 'Unkown';
  }
}
