import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
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
                    askforpermission();
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

  void askforpermission() async{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.notification,
      Permission.location,
    ].request();
    print(statuses[Permission.location]);
    print(statuses[Permission.notification]);
  }
}
