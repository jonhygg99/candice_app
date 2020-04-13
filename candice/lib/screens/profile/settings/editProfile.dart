import 'dart:io';

import 'package:candice/common/backgroundImage.dart';
import 'package:candice/common/bubbleSortDesign.dart';
import 'package:candice/common/profileImage.dart';
import 'package:candice/constants/colors.dart';
import 'package:candice/constants/measures.dart';
import 'package:candice/models/app_localizations.dart';
import 'package:candice/models/enum.dart';
import 'package:candice/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Text buildEditTittle(String title) {
  return Text(
    title,
    style: TextStyle(color: Colors.black54, fontSize: 15.0),
  );
}

class EditProfile extends StatefulWidget {
  EditProfile(this.user);
  final User user;

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isSwitched;
  File _backgroundImage;
  File _profileImage;

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
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: kBigSeparation),
                  Container(
                    height: kSizeEditBackgroundImage + kSizePhotoProfile / 4,
                    child: Stack(
                      children: <Widget>[
                        InkWell(
                          onTap: () => getImage(EditImageSection.Background),
                          child: Opacity(
                            opacity: kOpacity,
                            child: BackgroundImage(
                              imageUrl: widget.user.backgroundImage,
                              height: kSizeEditBackgroundImage,
                              imageFile: _backgroundImage,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: MediaQuery.of(context).size.width / 2 -
                              kCommonSeparation * 3,
                          child: InkWell(
                            onTap: () => getImage(EditImageSection.Profile),
                            child: PhotoProfile(
                              imageUrl: widget.user.photoProfile,
                              size: kSizePhotoProfile,
                              imageFile: _profileImage,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: kBigSeparation),
                  EditTextField(
                    title: AppLocalizations.of(context).translate('username'),
                    initialValue: widget.user.userName,
                    action: (String inputText) => print(inputText),
                  ),
                  EditProfession(),
                  const SizedBox(height: kBigSeparation),
                  EditTextField(
                    title:
                        AppLocalizations.of(context).translate('description'),
                    initialValue: widget.user.description,
                    action: (String inputText) => print(inputText),
                    bigLength: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      buildEditTittle(AppLocalizations.of(context)
                          .translate('addTheOptionToGetDonations')),
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
                              title: AppLocalizations.of(context)
                                  .translate('contributionDescription'),
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

  Future<Null> getImage(EditImageSection imageSection) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: kPink,
          toolbarTitle: EditImageSection.Background == imageSection
              ? AppLocalizations.of(context).translate('backgroundPhoto')
              : AppLocalizations.of(context).translate('profilePhoto'),
          toolbarWidgetColor: Colors.white,
          hideBottomControls: true,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));

    if (EditImageSection.Background == imageSection)
      setState(() => _backgroundImage = croppedImage);
    else
      setState(() => _profileImage = croppedImage);
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
    'dj': false,
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
        buildEditTittle(title),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildEditTittle(title),
        const SizedBox(height: kTinySeparation),
        TextField(
          maxLines: bigLength ? 3 : 1,
          maxLength: bigLength ? bigMaxLength + 50 : smallMaxLength + 20,
          controller: TextEditingController(text: initialValue),
          onChanged: action,
          buildCounter: (BuildContext context,
              {int currentLength, int maxLength, bool isFocused}) {
            if ((bigLength && currentLength > bigMaxLength) ||
                (!bigLength && currentLength > smallMaxLength))
              return Text(
                '-${currentLength - (bigLength ? bigMaxLength : smallMaxLength)} characters',
                style: TextStyle(color: Colors.red),
              );
            return null;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0.0),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}
