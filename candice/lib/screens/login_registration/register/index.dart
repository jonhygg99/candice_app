import 'package:candice/constants/colors.dart';
import 'package:candice/constants/enum.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationProcess extends StatelessWidget {
  RegistrationProcess(
      {@required this.registrationProcess,
      @required this.registrationMap,
      this.action,
      this.isLogIn = false});
  final RegistrationProcessType registrationProcess;
  final Map<RegistrationProcessType, String> registrationMap;
  final Function action;
  final bool isLogIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
//        title: Text(
//          isLogIn ? 'Log in' : 'Registration',
//          style: kWhiteBoldText,
//        ),
//        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kPink, kPinkGradientRegister],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHugeSeparation),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: kCommonSeparation),
                    Align(
                        alignment: Alignment.topCenter,
                        child:
                            Text(kCandice, style: kWhiteLogoTextRegistration)),
                    const SizedBox(height: 40.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(isLogIn ? 'Email/Username' : getText(),
                            style: kBigWhiteBoldText),
                        const SizedBox(height: kCommonSeparation),
                        TextFormFieldRegistration(
                          registrationProcess: registrationProcess,
                          registrationMap: registrationMap,
                        ),
                        isLogIn
                            ? const SizedBox(height: kCommonSeparation)
                            : Container(),
                        isLogIn
                            ? Text('Password', style: kBigWhiteBoldText)
                            : Container(),
                        isLogIn
                            ? const SizedBox(height: kCommonSeparation)
                            : Container(),
                        isLogIn
                            ? TextFormFieldRegistration(
                                registrationProcess:
                                    RegistrationProcessType.Password,
                                registrationMap: registrationMap,
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kSmallSeparation),
              Align(
                alignment: Alignment.bottomCenter,
                child: isLogIn
                    ? Row(
                        children: <Widget>[
                          RegistrationButton(
                            registrationProcess:
                                RegistrationProcessType.Password,
                            registrationMap: registrationMap,
                            action: action,
                            text: 'Log in',
                            isLogIn: true,
                          ),
                        ],
                      )
                    : Row(
                        children: <Widget>[
                          RegistrationButton(
                            registrationProcess: registrationProcess,
                            registrationMap: registrationMap,
                            action: action,
                            text: 'Back',
                            isBack: true,
                          ),
                          SizedBox(width: kCommonSeparation),
                          RegistrationButton(
                            registrationProcess: registrationProcess,
                            registrationMap: registrationMap,
                            action: action,
                            text: 'Next',
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getText() {
    if (registrationProcess == RegistrationProcessType.Email)
      return 'Email';
    else if (registrationProcess == RegistrationProcessType.Username)
      return 'Username';
    else
      return 'Password';
  }
}

class RegistrationButton extends StatelessWidget {
  RegistrationButton(
      {@required this.registrationProcess,
      @required this.registrationMap,
      this.action,
      @required this.text,
      this.isBack = false,
      this.isLogIn = false});

  final RegistrationProcessType registrationProcess;
  final Map<RegistrationProcessType, String> registrationMap;
  final Function action;
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
              Navigator.pop(context);
            } else {
              if (registrationProcess == RegistrationProcessType.Password)
                action();
              else {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        RegistrationProcess(
                      registrationProcess: getNextRegistationProcessType(),
                      registrationMap: registrationMap,
                      action: action,
                      isLogIn: false,
                    ),
                  ),
                );
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

  RegistrationProcessType getNextRegistationProcessType() {
    if (registrationProcess == RegistrationProcessType.Email)
      return RegistrationProcessType.Username;
    else
      return RegistrationProcessType.Password;
  }
}

class TextFormFieldRegistration extends StatelessWidget {
  TextFormFieldRegistration(
      {@required this.registrationProcess, @required this.registrationMap});
  final RegistrationProcessType registrationProcess;
  final Map<RegistrationProcessType, String> registrationMap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (String inputText) {
        if (registrationProcess == RegistrationProcessType.Email)
          registrationMap[registrationProcess] = inputText;
        else if (registrationProcess == RegistrationProcessType.Username)
          registrationMap[registrationProcess] = inputText;
        else
          registrationMap[registrationProcess] = inputText;
      },
      autofocus: false,
      cursorColor: Colors.white,
      controller:
          TextEditingController(text: registrationMap[registrationProcess]),
      maxLength: 255,
      buildCounter: (BuildContext context,
          {int currentLength, int maxLength, bool isFocused}) {
        return Text('');
      },
      validator: (value) {
        return null; // TODO
      },
      style: kWhiteBoldText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kBigSeparation,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
          borderRadius: kBorderRadiusCircular,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
          borderRadius: kBorderRadiusCircular,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
          borderRadius: kBorderRadiusCircular,
        ),
      ),
    );
  }
}
