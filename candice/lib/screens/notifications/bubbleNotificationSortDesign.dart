import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/material.dart';

class BubbleNotificationSortDesign extends StatelessWidget {
  BubbleNotificationSortDesign(
      {@required this.title, this.action, this.active});
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
              color: active ? kPink : Colors.white,
              border:
                  Border.all(width: 3, color: active ? kPink : Colors.black),
              borderRadius: BorderRadius.all(kBorderRadiusCircle)),
          child: Text(
            title,
            style: TextStyle(
              color: active ? Colors.white : Colors.black,
              fontFamily: kRobotoBold,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
