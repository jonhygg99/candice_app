import 'package:candice/constants/texts.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(kEditProfile),
              const SizedBox(height: 25),
              RaisedButton(
                  child: Text('Go back'),
                  onPressed: () => Navigator.pop(context))
            ],
          ),
        )),
      ),
    );
  }
}
