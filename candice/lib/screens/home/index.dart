import 'package:candice/constants/colors.dart';
import 'package:candice/constants/functions.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/screens/profile/backgroundImage.dart';
import 'package:flutter/material.dart';

import 'story/stories.dart';

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
    return ListView(
      children: <Widget>[
        Stories(),
        Posts(),
      ],
    );
  }
}

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

class PostDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingPost,
      child: Material(
        elevation: kElevation,
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                BackgroundImage(
                  backgroundImage:
                      'https://images.unsplash.com/photo-1581289098325-fd41f57a9d4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1301&q=80',
                  height: kPostBackgroundImageHeight,
                ),
                Positioned(
                  top: kCommonSeparation,
                  left: kCommonSeparation,
                  child: Text(
                    'Break my soul',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontFamily: kRobotoBold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: kPostBackgroundImageHeight / 2 - 50,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Opacity(
                    opacity: kOpacity,
                    child: Icon(
                      Icons.play_circle_filled,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 165,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kSmallSeparation,
                      vertical: kTinySeparation,
                    ),
                    child: Container(
                      width: kPostBackgroundImageHeight,
                      height: 30.0,
                      child: Row(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () => print('Liked post'),
                            color: Colors.grey.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.mode_comment,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: kTinySeparation),
                                Text(
                                  numberFormat(212),
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: kSmallSeparation),
                          FlatButton(
                            onPressed: () => print('Liked post'),
                            color: Colors.grey.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.favorite,
                                  color: kPink,
                                ),
                                const SizedBox(width: kTinySeparation),
                                Text(
                                  numberFormat(2032),
                                  style: const TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                              width: kHugeSeparation + kMediumSeparation),
//                        TextField(
//                          decoration:
//                              InputDecoration(hintText: 'Add comment...'),
//                        )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 90.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: kRadiusCircular, bottomRight: kRadiusCircular),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kMediumSeparation,
                  vertical: kSmallSeparation,
                ),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1536896407451-6e3dd976edd1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80'),
                      radius: 35.0,
                      backgroundColor: kDefaultColorLoading,
                    ),
                    const SizedBox(width: kCommonSeparation),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Julie Howard',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: kRobotoBold,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: kSmallSeparation),
                        Text(
                          '42 min ago',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
