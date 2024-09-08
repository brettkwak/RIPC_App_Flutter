import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripc_flutter/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RIPC App",
      theme: ThemeData(

      ),
      home: _getloginscreen(),
    );
  }

  Widget _getloginscreen(){
    return loginscreen();
  }
}