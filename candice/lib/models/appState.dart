import 'package:flutter/foundation.dart';

import 'user/currentUser.dart';

class AppState extends ChangeNotifier {
  AppState() {
    _fetchAll();
  }

  // User
  var currentUser = CurrentUser();

  Future<void> _fetchCurrentUser() async {
    currentUser.fetchUser('1');
  }

  // Music Player
  bool _showMusicTab = false;
  bool _openMusicTab = false;
  bool _musicPlaying = false;

  bool get showMusicTab => _showMusicTab;
  bool get openMusicTab => _openMusicTab;
  bool get musicPlaying => _musicPlaying;

  void showMusicTabAndPlay() {
    _showMusicTab = true;
    _musicPlaying = !_musicPlaying;
    notifyListeners();
  }

  void playStopMusic() {
    _musicPlaying = !_musicPlaying;
    notifyListeners();
  }

  Future<void> _fetchAll() async {
    print('fetching');
    _fetchCurrentUser();
    notifyListeners();
  }
}
