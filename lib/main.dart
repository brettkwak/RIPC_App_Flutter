import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'history.dart';
import 'settings.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false, //오른쪽위 debugBanner 없애기
//       title: 'RIPC_Flutter',
//       theme: ThemeData(
//           primaryColor: Colors.white,
//           scaffoldBackgroundColor: Colors.white,
//           appBarTheme: AppBarTheme(
//             foregroundColor: Colors.black,
//             backgroundColor: Colors.white,
//           )
//       ),
//       home: MyPage(),
//
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  int _currentIndex=0;
  List<Widget> body = const [
    // home(),
    Icon(Icons.home),
    // history(),
    Icon(Icons.folder),
    settings(),
    // Icon(Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              icon: Icon(Icons.home),
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