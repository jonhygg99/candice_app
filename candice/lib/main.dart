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
  int index = 0;
  List<Widget> screens;

  @override
  void initState() {
    screens = [
      Home(),
      Search(),
      AddPost(),
      Notifications(),
      Profile('a'),
    ];

//    Future.microtask(() =>
//        Provider.of<AppState>(context).fetchSomething(someValue);
//    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: true);
//    Consumer<AppState>(builder: (_, appState , __) => Text('a'));

    return Scaffold(
      backgroundColor: Colors.black,
      body: screens[index],
      persistentFooterButtons:
          appState.showMusicTab ? <Widget>[MusicPlayer()] : null,
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: index == 0 ? Colors.pinkAccent : Colors.white,
            ),
            title: const Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: index == 1 ? Colors.pinkAccent : Colors.white,
            ),
            title: const Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: index == 2 ? Colors.pinkAccent : Colors.white,
            ),
            title: Text('Add post'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: index == 3 ? Colors.pinkAccent : Colors.white,
            ),
            title: const Text('Notifications'),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: index == 4 ? Colors.pinkAccent : Colors.white,
              ),
              title: const Text('Profile'))
        ],
      ),
    );
  }
}

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: true);

    return Row(
      children: <Widget>[
        InkWell(
          child: Text(
            'Break my soul',
            style: TextStyle(
                color: Colors.white,
                fontFamily: kRobotoBold,
                fontWeight: FontWeight.bold),
          ),
          onTap: () => print('break'),
        ),
        IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () => print('a')),
        IconButton(
          icon: Icon(
            appState.musicPlaying
                ? Icons.pause_circle_filled
                : Icons.play_circle_filled,
            color: Colors.white,
          ),
          onPressed: appState.playStopMusic,
        ),
      ],
    );
//    Container(
//                padding: const EdgeInsets.symmetric(
//                    vertical:
//                        10.0), // TODO: is the good padding vertical to be in the center?
//    child: Row(
//    children: <Widget>[],
//    ),
  }
}
