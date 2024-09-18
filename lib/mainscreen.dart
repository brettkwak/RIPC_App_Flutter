import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'history.dart';
import 'settings.dart';

void main() {
  runApp(const mainscreen());
}


class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreen();
}

class _mainscreen extends State<mainscreen> {

  int _currentIndex=0;
  List<Widget> body = const [
    home(),
    history(),
    settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RIPC_Flutter",
      theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.black,
              selectedLabelStyle: TextStyle(fontSize: 12)
          )
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: body[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'History',
              icon: Icon(Icons.folder),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}