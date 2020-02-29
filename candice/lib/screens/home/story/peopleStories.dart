import 'package:flutter/material.dart';

import 'storyDesign.dart';

class PeopleStories extends StatelessWidget {
  final List<String> storiesPic = [
    'https://images.unsplash.com/photo-1536896407451-6e3dd976edd1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
    'https://images.unsplash.com/photo-1553457055-88e354f1257c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
    'https://images.unsplash.com/photo-1545064189-2d901f702a28?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
    'https://images.unsplash.com/photo-1501943416256-08140ba03763?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1436&q=80',
    'https://images.unsplash.com/photo-1572151510493-38eb612d23be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1268&q=80',
    'https://images.unsplash.com/photo-1548536154-b47a70d27d8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
    'https://images.unsplash.com/photo-1559870904-406aeea0a89c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1573600073102-d703f3f030ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1258&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildStoriesList(),
    );
  }

  List<StoryDesign> _buildStoriesList() {
    List<StoryDesign> widgets = [];

    storiesPic.forEach((pic) {
      widgets.add(StoryDesign(pic));
    });

    return widgets;
  }
}
