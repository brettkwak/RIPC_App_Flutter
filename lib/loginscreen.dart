import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ripc_flutter/mainscreen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'login_control.dart';

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
              Image(
                image: AssetImage("assets/car_image.jpg"),
                width: 400,
                height: 400,
              ),
              SizedBox(
                height: 32,
              ),
              SignInButton(

                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () async {
                  await loginProcess();
                  askforpermission();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mainscreen(),
                    ),
                  );
                },
              ),
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