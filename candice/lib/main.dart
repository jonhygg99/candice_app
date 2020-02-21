import 'package:candice/screens/add_post/index.dart';
import 'package:candice/screens/home/index.dart';
import 'package:candice/screens/notifications/index.dart';
import 'package:candice/screens/profile/index.dart';
import 'package:candice/screens/search/index.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: NavigationBar(),
      theme: ThemeData(fontFamily: 'Roboto'),
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
  int index = 4;
  final List<Widget> screens = [
    Home(),
    Search(),
    AddPost(),
    Notifications(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
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
          new BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              color: index == 0 ? Colors.pinkAccent : Colors.white,
            ),
            title: new Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(
              Icons.search,
              color: index == 1 ? Colors.pinkAccent : Colors.white,
            ),
            title: new Text('Search'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(
              Icons.add_circle,
              color: index == 2 ? Colors.pinkAccent : Colors.white,
            ),
            title: new Text('Add post'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(
              Icons.notifications,
              color: index == 3 ? Colors.pinkAccent : Colors.white,
            ),
            title: new Text('Notifications'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: index == 4 ? Colors.pinkAccent : Colors.white,
              ),
              title: Text('Profile'))
        ],
      ),
    );
  }
}
