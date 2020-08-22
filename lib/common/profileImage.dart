import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:candice/screens/profile/index.dart';
import 'package:flutter/material.dart';

//imageUrl: backgroundImage,
//placeholder: (context, url) =>
//CircularProgressIndicator(), // TODO: logo rotate
//errorWidget: (context, url, error) => FailBackgroundImage(
//height: height,
//width: _buildWidth(context),
//borderRadius: _buildBorderRadius()), // TODO: change

void goToUserProfile(context, appState, id) {
  appState.lastUser.fetchUser(id);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Profile(appState.lastUser)),
  );
}

class PhotoProfile extends StatelessWidget {
  PhotoProfile(
      {this.imageUrl, @required this.size, this.action, this.imageFile})
      : assert(imageUrl != null || imageFile != null);
  final String imageUrl;
  final double size;
  final Function action;
  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipOval(
          child: InkWell(
            child: imageFile != null
                ? Image.file(
                    imageFile,
                    width: size,
                    height: size,
                    fit: BoxFit.fitWidth,
                  )
                : CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: size,
                    height: size,
                    fit: BoxFit.fitWidth,
                    //placeholder: (context, url) =>
//CircularProgressIndicator(), // TODO: logo rotate
                    errorWidget: (context, url, error) =>
                        FailPhotoProfile()), // TODO: change
          ),
        ),
      ),
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
