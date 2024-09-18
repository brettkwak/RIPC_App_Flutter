import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ripc_flutter/mainscreen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:ripc_flutter/user_data.dart';

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
              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () async {
                  var user = await LoginAPI.login();
                  if (user != null) {
                    print(user.displayName);
                    print(user.email);
                    print(user.id);
                    print(user.photoUrl);
                    user_data().email = user.email;
                    user_data().profile_image_url = user.photoUrl;
                    user_data().user_name = user.displayName;
                    user_data().user_id = user.id;
                  }
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

class LoginAPI {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}