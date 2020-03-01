import 'package:flutter/material.dart';

import 'postDesign.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <PostDesign>[
        PostDesign(),
        PostDesign(),
      ],
    );
  }
}
