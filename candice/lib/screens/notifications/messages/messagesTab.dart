import 'package:candice/common/searchTextField.dart';
import 'package:candice/constants/measures.dart';
import 'package:flutter/material.dart';

import 'bubbleMessageDesign.dart';

class MessagesTab extends StatelessWidget {
  Future<Null> _refreshMessages() async {}

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshMessages, // TODO: call to fetch the message
      child: ListView(
        children: <Widget>[
          SearchTextField(),
          const SizedBox(height: kCommonSeparation),
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
      ),
    );
  }
}
