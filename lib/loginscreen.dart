import 'package:flutter/material.dart';
import 'package:ripc_flutter/mainscreen.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Screen",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => mainscreen(),
                      ),
                    );
                  },
                  child: Text("Sign in with Google"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
