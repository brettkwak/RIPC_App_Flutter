import 'package:flutter/material.dart';

import 'home.dart';
import 'history.dart';
import 'settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      debugShowCheckedModeBanner: false, //오른쪽위 debugBanner 없애기
      title: 'bottomNavigationBar',
      home: MyPage(),
//      home: Center(
//        child: Container(width:50, height: 50, color: Colors.blue,),
//      )
    );
  }
}


class MyPage extends StatefulWidget { // bottomNavigationBar은 반드시 Stateful이어야함.
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int currentIndex =0;
  final screens = [ //이게 하나하나의 화면이되고, Text등을 사용하거나, dart파일에 있는 class를 넣는다.
    home(),
    history(),
    settings(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() =>currentIndex = index), //setState를 써야 바뀐다.

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}