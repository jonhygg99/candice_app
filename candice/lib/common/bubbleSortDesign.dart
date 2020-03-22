import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/material.dart';

class BubbleSortDesign extends StatelessWidget {
  BubbleSortDesign({@required this.title, this.action, this.active});
  final String title;
  final Function action;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kSmallSeparation),
      child: InkWell(
        borderRadius: BorderRadius.all(kBorderRadiusCircle),
        onTap: action,
        child: Container(
          padding: kPaddingBubbleNotificationSort,
          decoration: BoxDecoration(
            color: active ? kPink : Colors.black54,
            borderRadius: BorderRadius.all(kBorderRadiusCircle),
          ),
          child: Text(
            title,
            style: kWhiteBoldText,
          ),
        ),
      ),
    );
  }
}
