import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: kBorderRadiusSomeBorder),
      elevation: kElevation,
      child: TextField(
        onChanged: (String inputText) => print(inputText),
        decoration: InputDecoration(
            hintText: AppLocalizations.of(context).translate('search'),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(kRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(kRadius),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
            contentPadding: const EdgeInsets.all(0.0),
            icon: Padding(
              padding: const EdgeInsets.only(left: kTinySeparation),
              child: Material(
                elevation: kElevation,
                borderRadius: BorderRadius.all(kBorderRadiusCircle),
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: kPink,
                    borderRadius: BorderRadius.all(kBorderRadiusCircle),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
