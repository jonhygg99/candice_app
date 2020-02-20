import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Stack(alignment: Alignment(0, 2.4), children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: kRadiusCircular,
                  bottomRight: kRadiusCircular,
                ),
                child: FittedBox(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1580331451062-99ff652288d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
                    fit: BoxFit.fitWidth,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Card(
                margin: kMarginCard,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: kBorderRadiusCircular,
                ),
                elevation: kElevation,
                child: Padding(
                  padding: kPaddingCard,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1578680671705-0965e325b2ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1233&q=80"),
                            radius: 40.0,
                          ),
                          SizedBox(width: kCommonSeparation),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Laia Montés",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32.0),
                              ),
                              SizedBox(height: kSmallSeparation),
                              Text(
                                "Singer and Guitarrist",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: kCommonSeparation),
                      Text(
                        "I’m a musician who loves Pop and Rock. 🤘 Currently studying for being a lawyer, but what I truly want is to sing in the shower.",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: kBigSeparation),
                      Row(
                        children: [
                          ActionButton(
                            title: 'Play songs',
                            color: kLightBlue,
                            action: () {},
                          ),
                          SizedBox(width: kCommonSeparation),
                          ActionButton(
                            title: "I'm fan",
                            color: kPink,
                            action: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  ActionButton({this.title, this.color, this.action});
  final String title;
  final Color color;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        onPressed: action,
        color: color,
        elevation: kElevation,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        shape: RoundedRectangleBorder(borderRadius: kBorderRadiusCircular),
      ),
    );
  }
}
