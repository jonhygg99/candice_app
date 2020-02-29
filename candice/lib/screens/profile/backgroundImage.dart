import 'package:candice/constants/measures.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  BackgroundImage({this.backgroundImage, @required this.height});
  final String backgroundImage;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _buildBorderRadius(),
      child: FittedBox(
        child: Image.network(backgroundImage,
            fit: BoxFit.fitWidth,
            height: height,
            width: height != kPostPreviewBackgroundImageHeight
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width / 2 -
                    (kMediumSeparation + kMediumSeparation)),
      ),
    );
  }

  BorderRadius _buildBorderRadius() {
    if (kBackgroundImageHeight == height)
      return const BorderRadius.only(
          bottomLeft: kRadiusCircular, bottomRight: kRadiusCircular);
    else if (kPostPreviewBackgroundImageHeight == height)
      return const BorderRadius.all(Radius.circular(kRadius));
    else if (kPostBackgroundImageHeight == height)
      return const BorderRadius.only(
          topLeft: kRadiusCircular, topRight: kRadiusCircular);
    else
      return const BorderRadius.all(Radius.circular(kRadius));
  }
}
