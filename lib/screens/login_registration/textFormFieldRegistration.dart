import 'package:candice/constants/enum.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/constants/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldRegistration extends StatefulWidget {
  TextFormFieldRegistration(
      {@required this.registrationProcess, @required this.registrationMap});
  final RegistrationProcessType registrationProcess;
  final Map<RegistrationProcessType, String> registrationMap;

  @override
  _TextFormFieldRegistrationState createState() =>
      _TextFormFieldRegistrationState();
}

class _TextFormFieldRegistrationState extends State<TextFormFieldRegistration> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (String inputText) {
        if (widget.registrationProcess == RegistrationProcessType.Email)
          widget.registrationMap[widget.registrationProcess] = inputText;
        else if (widget.registrationProcess == RegistrationProcessType.Username)
          widget.registrationMap[widget.registrationProcess] = inputText;
        else
          widget.registrationMap[widget.registrationProcess] = inputText;
      },
      onSaved: (String inputText) {
        if (widget.registrationProcess == RegistrationProcessType.Email)
          widget.registrationMap[widget.registrationProcess] = inputText;
        else if (widget.registrationProcess == RegistrationProcessType.Username)
          widget.registrationMap[widget.registrationProcess] = inputText;
        else
          widget.registrationMap[widget.registrationProcess] = inputText;
      },
      keyboardType: TextInputType.text,
      autofocus: false,
      obscureText:
          widget.registrationProcess == RegistrationProcessType.Password &&
              !_isVisible,
      cursorColor: Colors.white,
      controller: TextEditingController(
          text: widget.registrationMap[widget.registrationProcess]),
      maxLength: 255,
      buildCounter: (BuildContext context,
          {int currentLength, int maxLength, bool isFocused}) {
        return Text('');
      },
      validator: (value) {
        if (widget.registrationProcess == RegistrationProcessType.Password) {
          return value.length < 6 ? 'Password too short.' : null;
        } else
          return null; // TODO: validator
      },
      style: kWhiteBoldText,
      decoration: InputDecoration(
        suffixIcon:
            widget.registrationProcess == RegistrationProcessType.Password
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon: Icon(
                        _isVisible ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() => _isVisible = !_isVisible);
                      },
                    ),
                  )
                : Icon(null),
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
