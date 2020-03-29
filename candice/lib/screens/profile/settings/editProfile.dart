import 'package:candice/common/bubbleSortDesign.dart';
import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:candice/models/user/user.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  EditProfile(this.user);
  final User user;

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isSwitched;

  @override
  void initState() {
    isSwitched = widget.user.contributeBubble;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context).translate('editProfile'),
                style: TextStyle(color: Colors.black54),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black54),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kCommonSeparation),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: kBigSeparation),
                  EditTextField(
                    title: 'Username',
                    initialValue: widget.user.userName,
                    action: (String inputText) => print(inputText),
                  ),
                  EditProfession(),
                  const SizedBox(height: kBigSeparation),
                  EditTextField(
                    title: 'Description',
                    initialValue: widget.user.description,
                    action: (String inputText) => print(inputText),
                    bigLength: true,
                  ),
                  const SizedBox(height: kBigSeparation),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Add the option to get donations',
                        style: TextStyle(color: Colors.black54),
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) =>
                            setState(() => isSwitched = value),
                        activeTrackColor: kPinkSwitch,
                        activeColor: kPink,
                      ),
                    ],
                  ),
                  isSwitched
                      ? Column(
                          children: <Widget>[
                            EditTextField(
                              title: 'Contribution escription',
                              initialValue: widget.user.contributeDescription,
                              action: (String inputText) => print(inputText),
                              bigLength: true,
                            ),
                            Text('Card details')
                          ],
                        )
                      : const SizedBox(height: 0),
                ],
              ),
            )),
      ),
    );
  }
}

class EditProfession extends StatefulWidget {
  @override
  _EditProfessionState createState() => _EditProfessionState();
}

class _EditProfessionState extends State<EditProfession> {
  Map<String, bool> profession = {
    'singer': false,
    'compositor': false,
    'musician': false,
    'DJ': false,
  };
  Map<String, bool> musician = {
    'pianist': false,
    'guitarrist': false,
    'violinist': false
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildProfession(profession, 'Profesion'),
        profession['musician']
            ? _buildProfession(musician, 'Musician')
            : const SizedBox(height: 0),
      ],
    );
  }

  Text _buildTittle(String title) {
    return Text(
      title,
      style: TextStyle(color: Colors.black54, fontSize: 15.0),
    );
  }

  Widget _buildProfession(Map<String, bool> map, String title) {
    List<Widget> widgets = [];

    map.forEach((type, state) => widgets.add(BubbleSortDesign(
          title: type,
          active: state,
          action: () => reverseBubbleState(map, type),
          isPadding: true,
        )));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: kCommonSeparation),
        _buildTittle(title),
        const SizedBox(height: kSmallSeparation),
        Wrap(
          runSpacing: kTinySeparation,
          spacing: kTinySeparation,
          children: widgets,
        ),
      ],
    );
  }

  void reverseBubbleState(Map type, String category) =>
      setState(() => type[category] = !type[category]);
}

class EditTextField extends StatelessWidget {
  EditTextField(
      {this.title, this.initialValue, this.action, this.bigLength = false});
  final String title;
  final String initialValue;
  final Function action;
  final bool bigLength;

  final int bigMaxLength = 150;
  final int smallMaxLength = 25;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: bigLength ? 3 : 1,
      maxLength: bigLength ? bigMaxLength + 50 : smallMaxLength,
      controller: TextEditingController(text: initialValue),
      onChanged: action,
      buildCounter: (BuildContext context,
          {int currentLength, int maxLength, bool isFocused}) {
        if (bigLength && currentLength > bigMaxLength)
          return Text(
            '-${currentLength - bigMaxLength} characters',
            style: TextStyle(color: Colors.red),
          );
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0.0),
        labelText: title,
        labelStyle: TextStyle(color: Colors.black54, fontSize: 20),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
        ),
      ),
    );
  }
}
