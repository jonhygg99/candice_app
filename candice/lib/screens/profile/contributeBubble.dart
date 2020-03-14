import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:flutter/material.dart';

class ContributeBubble extends StatelessWidget {
  ContributeBubble({this.contributeDescription});
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
                    0.0, // TODO: Is a Square elevation and should be with the button
                onPressed: () {},
//                color: Colors.transparent,
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  width: 220,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context).translate('contribute'),
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: kRobotoBold,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  padding: kPaddingButton,
                  decoration: const BoxDecoration(
//                    boxShadow: ,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: const LinearGradient(
                      colors: <Color>[kYellowGradient, kPinkGradient],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
