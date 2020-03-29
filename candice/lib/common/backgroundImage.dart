import 'package:cached_network_image/cached_network_image.dart';
import 'package:candice/constants/measures.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  BackgroundImage({@required this.backgroundImage, @required this.height});
  final String backgroundImage;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _buildBorderRadius(),
      child: FittedBox(
        child: CachedNetworkImage(
          imageUrl: backgroundImage,
//          placeholder: (context, url) =>
//              CircularProgressIndicator(), // TODO: logo rotate
          errorWidget: (context, url, error) => FailBackgroundImage(
              height: height,
              width: _buildWidth(context),
              borderRadius: _buildBorderRadius()), // TODO: change
          fit: BoxFit.fitWidth,
          height: height,
          width: _buildWidth(context),
        ),
      ),
    );
  }

  double _buildWidth(context) {
    if (height == kPostPreviewBackgroundImageHeight)
      return MediaQuery.of(context).size.width / 2 -
          (kMediumSeparation + kMediumSeparation);
    else if (height == kBackgroundImageHeight)
      return MediaQuery.of(context).size.width;
    else
      return height;
  }

  BorderRadius _buildBorderRadius() {
    if (kBackgroundImageHeight == height)
      return const BorderRadius.all(Radius.circular(0));
    else if (kPostPreviewBackgroundImageHeight == height)
      return const BorderRadius.all(Radius.circular(kRadius));
    else if (kPostBackgroundImageHeight == height)
      return const BorderRadius.only(
          topLeft: kRadiusCircular, topRight: kRadiusCircular);
    else if (kSizePhotoEventsNearYou == height)
      return const BorderRadius.only(
          topLeft: kRadiusCircular, bottomLeft: kRadiusCircular);
    else
      return const BorderRadius.all(Radius.circular(kRadius));
  }
}

class FailBackgroundImage extends StatelessWidget {
  FailBackgroundImage({
    @required this.width,
    @required this.height,
    @required this.borderRadius,
  });
  final double width;
  final double height;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: borderRadius, color: Colors.grey),
      child: Center(
        child: Text(
          'Can\'t load image!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
