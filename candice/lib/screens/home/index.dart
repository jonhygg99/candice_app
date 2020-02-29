import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'Candice',
              style:
                  TextStyle(color: kPink, fontFamily: kPacifico, fontSize: 24),
            ),
            bottom: TabBar(
              tabs: [Tab(text: kFollowing), Tab(text: kTrending)],
              unselectedLabelColor: Colors.black54,
              labelColor: kPink,
              unselectedLabelStyle: kBigBoldText,
              labelStyle: kBigBoldText,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.transparent,
            ),
          ),
          body: TabBarView(
            children: [
              PostSection(),
              Text('222222222222'),
            ],
          ),
        ),
      ),
    );
  }
}

class PostSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Story(),
        Text('111111111111'),
      ],
    );
  }
}

class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          AddStory(),
          PeopleStories(),
        ],
      ),
    );
  }
}

class AddStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kBigSeparation,
          top: kCommonSeparation,
          right: kMediumSeparation / 2,
          bottom: kHugeSeparation),
      child: InkWell(
        onTap: () => print('profile bubble tapped'),
        borderRadius: BorderRadius.all(Radius.circular(35.0)),
        child: Stack(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1578680671705-0965e325b2ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1233&q=80',
              ),
              radius: 35.0,
              backgroundColor: kDefaultColorLoading,
            ),
            Positioned(
              right: -1.0,
              bottom: 0,
              child: Icon(Icons.add_circle, color: Colors.pinkAccent),
            )
          ],
        ),
      ),
    );
  }
}

class StoryDesign extends StatelessWidget {
  StoryDesign(this.profilePic);
  final String profilePic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kMediumSeparation / 2,
          top: kCommonSeparation,
          right: kMediumSeparation / 2,
          bottom: kHugeSeparation),
      child: InkWell(
        onTap: () => print('profile bubble tapped'),
        borderRadius: BorderRadius.all(Radius.circular(35.0)),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kLightPink, width: 3)),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.transparent, width: 2)),
            child: CircleAvatar(
              backgroundImage: NetworkImage(profilePic),
              radius: 35.0,
              backgroundColor: kDefaultColorLoading,
            ),
          ),
        ),
      ),
    );
  }
}

class PeopleStories extends StatelessWidget {
  final List<String> storiesPic = [
    'https://images.unsplash.com/photo-1536896407451-6e3dd976edd1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
    'https://images.unsplash.com/photo-1553457055-88e354f1257c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
    'https://images.unsplash.com/photo-1545064189-2d901f702a28?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
    'https://images.unsplash.com/photo-1501943416256-08140ba03763?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1436&q=80',
    'https://images.unsplash.com/photo-1572151510493-38eb612d23be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1268&q=80',
    'https://images.unsplash.com/photo-1548536154-b47a70d27d8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
//    'https://images.unsplash.com/photo-1582129617595-c657a072c9b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3662&q=80',
//    'https://images.unsplash.com/photo-1559870904-406aeea0a89c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildStoriesList(),
    );
  }

  List<StoryDesign> _buildStoriesList() {
    List<StoryDesign> widgets = [];
    int i = 0;

    storiesPic.forEach((pic) {
      ++i;
      widgets.add(StoryDesign(pic));
    });

    return widgets;
  }
}
