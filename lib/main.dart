import 'package:flutter/material.dart';
import 'package:twitter/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black26, width: 0.3))),
            child: Theme(
              data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: BottomNavigationBar(
                elevation: 0,
                showSelectedLabels: false, // <-- HERE
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_rounded,
                        size: 30,
                      ),
                      label: "Home",
                      tooltip: '',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search_outlined,
                        size: 30,
                      ),
                      label: "Search",
                      tooltip: '',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.notifications_outlined,
                        size: 30,
                      ),
                      label: "Notifications",
                      tooltip: '',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.email_outlined,
                        size: 30,
                      ),
                      label: "Messages",
                      tooltip: '',
                      backgroundColor: Colors.white)
                ],
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black54,
              ),
            )));
  }
}
