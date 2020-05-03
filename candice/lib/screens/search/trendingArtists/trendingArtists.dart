import 'package:candice/common/backgroundImage.dart';
import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/material.dart';

class TrendingArtists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kCommonSeparation),
      child: Wrap(
        runSpacing: kMediumSeparation,
        children: <Widget>[
          TrendingArtistPostDesign(),
          TrendingArtistPostDesign(),
          TrendingArtistPostDesign(),
          Container(),
        ],
      ),
    );
  }
}

class TrendingArtistPostDesign extends StatefulWidget {
  @override
  _TrendingArtistPostDesignState createState() =>
      _TrendingArtistPostDesignState();
}

class _TrendingArtistPostDesignState extends State<TrendingArtistPostDesign> {
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      BackgroundImage(
        height: kPostTrendingArtistSize,
        imageUrl:
            'https://images.unsplash.com/photo-1568530134868-5d89f49d5a72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80',
      ),
      Positioned(
        bottom: kCommonSeparation,
        left: kBigSeparation,
        child: Container(
          width: kPostTrendingArtistSize - (kCommonSeparation * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width -
                        ((kCommonSeparation * 2) +
                            kBigSeparation * 2 +
                            kIconButtonSize +
                            kSmallSeparation),
                    child: Text(
                      'Gloria Mckinney',
                      style: kBigWhiteBoldText,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: kTinySeparation),
                  Text('Pop Singer', style: kWhiteBoldText),
                ],
              ),
              SizedBox.fromSize(
                size: Size(kIconButtonSize, kIconButtonSize),
                child: ClipOval(
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(
                            color: Colors.white, width: isFollow ? 0.0 : 2.5)),
                    color: isFollow ? kPink : Colors.transparent,
                    child: InkWell(
                      splashColor: isFollow ? Colors.transparent : kPink,
                      onTap: () => setState(() {
                        this.isFollow = !this.isFollow;
                      }),
                      child: isFollow
                          ? Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 18,
                            )
                          : Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
