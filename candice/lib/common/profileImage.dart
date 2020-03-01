import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//imageUrl: backgroundImage,
//placeholder: (context, url) =>
//CircularProgressIndicator(), // TODO: logo rotate
//errorWidget: (context, url, error) => FailBackgroundImage(
//height: height,
//width: _buildWidth(context),
//borderRadius: _buildBorderRadius()), // TODO: change

class PhotoProfile extends StatelessWidget {
  PhotoProfile({this.imageUrl, this.size});
  final String imageUrl;
  final double size;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: size,
          height: size,
          fit: BoxFit.fitWidth,
          //placeholder: (context, url) =>
//CircularProgressIndicator(), // TODO: logo rotate
          errorWidget: (context, url, error) =>
              FailPhotoProfile()), // TODO: change
    );
  }
}

class FailPhotoProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 80,
        height: 80,
        color: Colors.grey,
      ),
    );
  }
}
