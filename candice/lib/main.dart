import 'package:candice/constants/typography.dart';
import 'package:candice/models/appState.dart';
import 'package:candice/screens/add_post/index.dart';
import 'package:candice/screens/home/index.dart';
import 'package:candice/screens/notifications/index.dart';
import 'package:candice/screens/profile/index.dart';
import 'package:candice/screens/search/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candice',
      home: ChangeNotifierProvider<AppState>(
        create: (context) => AppState(),
        child: NavigationBar(),
      ),
      theme: ThemeData(fontFamily: kRobotoFontFamily),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationBarState();
  }
}

class _NavigationBarState extends State<NavigationBar> {
//  final music = Provider.of<Music>(context, listen: false);
  bool openMusicTab = false;
  bool showMusicTab = false;
  bool playMusic = false;
  int index = 3;
  List<Widget> screens;

  @override
  void initState() {
    final appState = Provider.of<AppState>(context, listen: false);
    screens = [
      Home(),
      Search(),
      AddPost(),
      Notifications(),
      Profile(appState.currentUser),
    ];
//    print(appState.currentUser.userName);
//    Future.microtask(() =>
//        Provider.of<AppState>(context).fetchSomething(someValue);
//    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: screens[index],
//      persistentFooterButtons:
//          appState.showMusicTab ? <Widget>[MusicPlayer()] : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: const Icon(Icons.home, color: Colors.pinkAccent),
            icon: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home'),
          ),
          BottomNavigationBarItem(
            activeIcon: const Icon(Icons.search, color: Colors.pinkAccent),
            icon: const Icon(Icons.search, color: Colors.white),
            title: const Text('Search'),
          ),
          BottomNavigationBarItem(
            activeIcon: const Icon(Icons.add_circle, color: Colors.pinkAccent),
            icon: const Icon(Icons.add_circle, color: Colors.white),
            title: const Text('Add post'),
          ),
          BottomNavigationBarItem(
            activeIcon:
                const Icon(Icons.notifications, color: Colors.pinkAccent),
            icon: const Icon(Icons.notifications, color: Colors.white),
            title: const Text('Notifications'),
          ),
          BottomNavigationBarItem(
              activeIcon: const Icon(Icons.person, color: Colors.pinkAccent),
              icon: const Icon(Icons.person, color: Colors.white),
              title: const Text('Profile'))
        ],
      ),
    );
  }
}

//class MusicPlayer extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final appState = Provider.of<AppState>(context, listen: true);
//
//    return Row(
//      children: <Widget>[
//        InkWell(
//          child: Text(
//            'Break my soul',
//            style: TextStyle(
//                color: Colors.white,
//                fontFamily: kRobotoBold,
//                fontWeight: FontWeight.bold),
//          ),
//          onTap: () => print('break'),
//        ),
//        IconButton(
//            icon: Icon(Icons.favorite_border, color: Colors.white),
//            onPressed: () => print('a')),
//        IconButton(
//          icon: Icon(
//            appState.musicPlaying
//                ? Icons.pause_circle_filled
//                : Icons.play_circle_filled,
//            color: Colors.white,
//          ),
//          onPressed: appState.playStopMusic,
//        ),
//      ],
//    );
////    Container(
////                padding: const EdgeInsets.symmetric(
////                    vertical:
////                        10.0), // TODO: is the good padding vertical to be in the center?
////    child: Row(
////    children: <Widget>[],
////    ),
//  }
//}
