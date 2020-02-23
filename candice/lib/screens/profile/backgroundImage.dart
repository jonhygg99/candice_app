import 'package:candice/constants/measures.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  BackgroundImage({this.backgroundImage, @required this.height});
  final String backgroundImage;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: height == kBackgroundImageHeight
          ? BorderRadius.only(
              bottomLeft: kRadiusCircular, bottomRight: kRadiusCircular)
          : BorderRadius.all(Radius.circular(kRadius)),
      child: FittedBox(
        child: Image.network(backgroundImage,
            fit: BoxFit.fitWidth,
            height: height,
            width: height == kBackgroundImageHeight
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width / 2 -
                    (kMediumSeparation + kMediumSeparation)),
      ),
    );
  }
}
