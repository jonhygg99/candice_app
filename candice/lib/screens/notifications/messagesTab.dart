import 'package:flutter/material.dart';

import 'bubbleMessageDesign.dart';

class MessagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BubbleMessageDesign(
          profilePic:
              'https://images.unsplash.com/photo-1583129554586-fc0443875a57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1301&q=80',
          userName: 'Arlene Fox',
          lastMessage: 'When we will sing together? 😇',
          newMessages: 2,
          story: true,
        ),
        BubbleMessageDesign(
          profilePic:
              'https://images.unsplash.com/photo-1580851935978-f6b4e359da3f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
          userName: 'James Calvo',
          lastMessage: 'You have a beautiful voice!',
        )
      ],
    );
  }
}
