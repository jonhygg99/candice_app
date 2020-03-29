import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/material.dart';

class BubbleSortDesign extends StatelessWidget {
  BubbleSortDesign({
    @required this.title,
    this.action,
    this.active = false,
    this.color,
    this.isPadding = false,
  });
  final String title;
  final Function action;
  final bool active;
  final Color color;
  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    final Color finalColor =
        color != null ? color : (active ? kPink : Colors.black54);
    return Padding(
      padding: color != null || isPadding
          ? const EdgeInsets.all(0.0)
          : const EdgeInsets.only(right: kSmallSeparation),
      child: InkWell(
        borderRadius: BorderRadius.all(kBorderRadiusCircle),
        onTap: action,
        child: Container(
          padding: kPaddingBubbleNotificationSort,
          decoration: BoxDecoration(
            color: finalColor,
            borderRadius: BorderRadius.all(kBorderRadiusCircle),
          ),
          child: Text(
            title,
            style: color == kGrey ? kBoldText : kWhiteBoldText,
          ),
        ),
      ),
    );
  }
}
