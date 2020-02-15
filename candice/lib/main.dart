import 'package:candice/screens/profile/index.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: new Text('Add'),
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
