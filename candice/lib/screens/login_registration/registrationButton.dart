import 'package:candice/constants/enum.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationButton extends StatelessWidget {
  RegistrationButton(
      {@required this.registrationProcess,
      @required this.registrationMap,
      this.action,
      this.changeProcess,
      @required this.text,
      this.isBack = false,
      this.isLogIn = false});

  final RegistrationProcessType registrationProcess;
  final Map<RegistrationProcessType, String> registrationMap;
  final Function action;
  final Function changeProcess;
  final String text;
  final bool isBack;
  final bool isLogIn;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: kCommonSeparation),
        child: RaisedButton(
          onPressed: () {
            if (isBack) {
              if (registrationProcess == RegistrationProcessType.Email)
                Navigator.pop(context);
              else
                changeProcess(getBackProcess());
            } else {
              if (registrationProcess == RegistrationProcessType.Password)
                action();
              else {
                changeProcess(getNextProcess());
              }
            }
          },
          color: Colors.white,
          child: Text(text, style: kPinkText),
          padding: EdgeInsets.symmetric(vertical: kSmallSeparation),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kSmallSeparation),
          ),
        ),
      ),
    );
  }

  RegistrationProcessType getNextProcess() {
    if (registrationProcess == RegistrationProcessType.Email)
      return RegistrationProcessType.Username;
    else
      return RegistrationProcessType.Password;
  }

  RegistrationProcessType getBackProcess() {
    if (registrationProcess == RegistrationProcessType.Username)
      return RegistrationProcessType.Email;
    else
      return RegistrationProcessType.Username;
  }
}
