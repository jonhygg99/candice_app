import 'package:flutter/foundation.dart';

import '../constants/enum.dart';
import 'user/currentUser.dart';
import 'user/lastUser.dart';

class AppState extends ChangeNotifier {
  AppState() {
    _fetchAll();
  }

  // User
  CurrentUser currentUser = CurrentUser();
  LastUser lastUser = LastUser();

  Future<void> _fetchCurrentUser() async {
    currentUser.fetchUser(0);
  }

  // Notifications Screen
  Map<NotificationBubble, bool> notificationBubbleState = {
    NotificationBubble.Likes: true,
    NotificationBubble.Comments: true,
    NotificationBubble.Mentions: true
  };

  void reverseNotificationBubbleState(NotificationBubble category) {
    notificationBubbleState[category] = !notificationBubbleState[category];
    notifyListeners();
  }

  // Music Player
//  bool _showMusicTab = false;
//  bool _openMusicTab = false;
//  bool _musicPlaying = false;
//
//  bool get showMusicTab => _showMusicTab;
//  bool get openMusicTab => _openMusicTab;
//  bool get musicPlaying => _musicPlaying;
//
//  void showMusicTabAndPlay() {
//    _showMusicTab = true;
//    _musicPlaying = !_musicPlaying;
//    notifyListeners();
//  }
//
//  void playStopMusic() {
//    _musicPlaying = !_musicPlaying;
//    notifyListeners();
//  }

  Future<void> _fetchAll() async {
    print('fetching');
    _fetchCurrentUser();
    notifyListeners();
  }
}
