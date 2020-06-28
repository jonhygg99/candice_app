import 'package:candice/constants/colors.dart';
import 'package:candice/constants/enum.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/texts.dart';
import 'package:candice/constants/typography.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'registrationButton.dart';
import 'textFormFieldRegistration.dart';

class RegistrationProcess extends StatefulWidget {
  RegistrationProcess({
    @required this.registrationProcess,
    this.action,
    this.isLogIn = false,
  });
  RegistrationProcessType registrationProcess;
  final Function action;
  final bool isLogIn;

  @override
  _RegistrationProcessState createState() => _RegistrationProcessState();
}

class _RegistrationProcessState extends State<RegistrationProcess> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<RegistrationProcessType, String> _registrationMap = {
    RegistrationProcessType.Email: '',
    RegistrationProcessType.Username: '',
    RegistrationProcessType.Password: ''
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          widget.isLogIn
              ? AppLocalizations.of(context).translate('logIn')
              : AppLocalizations.of(context).translate('register'),
          style: kWhiteBoldText,
        ),
        centerTitle: true,
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
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              widget.isLogIn
                                  ? AppLocalizations.of(context)
                                          .translate('email') +
                                      '/' +
                                      AppLocalizations.of(context)
                                          .translate('username')
                                  : getText(),
                              style: kBigWhiteBoldText),
                          const SizedBox(height: kCommonSeparation),
                          TextFormFieldRegistration(
                            registrationProcess: widget.registrationProcess,
                            registrationMap: _registrationMap,
                          ),
                          widget.isLogIn
                              ? const SizedBox(height: kCommonSeparation)
                              : Container(),
                          widget.isLogIn
                              ? Text(
                                  AppLocalizations.of(context)
                                      .translate('password'),
                                  style: kBigWhiteBoldText)
                              : Container(),
                          widget.isLogIn
                              ? const SizedBox(height: kCommonSeparation)
                              : Container(),
                          widget.isLogIn
                              ? TextFormFieldRegistration(
                                  registrationProcess:
                                      RegistrationProcessType.Password,
                                  registrationMap: _registrationMap,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kSmallSeparation),
              Align(
                alignment: Alignment.bottomCenter,
                child: widget.isLogIn
                    ? Row(
                        children: <Widget>[
                          RegistrationButton(
                            registrationProcess:
                                RegistrationProcessType.Password,
                            registrationMap: _registrationMap,
                            action: widget.action,
                            text:
                                AppLocalizations.of(context).translate('logIn'),
                            isLogIn: true,
                          ),
                        ],
                      )
                    : Row(
                        children: <Widget>[
                          RegistrationButton(
                            registrationProcess: widget.registrationProcess,
                            registrationMap: _registrationMap,
                            action: widget.action,
                            changeProcess: (RegistrationProcessType type) =>
                                setState(
                                    () => widget.registrationProcess = type),
                            text:
                                AppLocalizations.of(context).translate('back'),
                            isBack: true,
                          ),
                          SizedBox(width: kCommonSeparation),
                          RegistrationButton(
                            registrationProcess: widget.registrationProcess,
                            registrationMap: _registrationMap,
                            action: widget.action,
                            changeProcess: (RegistrationProcessType type) =>
                                setState(
                                    () => widget.registrationProcess = type),
                            text: widget.registrationProcess ==
                                    RegistrationProcessType.Password
                                ? AppLocalizations.of(context)
                                    .translate('register')
                                : AppLocalizations.of(context)
                                    .translate('next'),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );

    void changeRegistrationProcess(RegistrationProcessType type) {
      setState(() {
        widget.registrationProcess = type;
      });
    }
  }

  String getText() {
    if (widget.registrationProcess == RegistrationProcessType.Email)
      return AppLocalizations.of(context).translate('email');
    else if (widget.registrationProcess == RegistrationProcessType.Username)
      return AppLocalizations.of(context).translate('username');
    else
      return AppLocalizations.of(context).translate('password');
  }
}
