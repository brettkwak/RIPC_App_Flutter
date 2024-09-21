import 'package:flutter/material.dart';
import 'package:ripc_flutter/about.dart';
import 'package:ripc_flutter/loginscreen.dart';
import 'package:ripc_flutter/user_data.dart';
import 'login_control.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    String? email = user_data().email;
    String? profile_image_url = user_data().profile_image_url;

    return MaterialApp(
      title: 'Settings',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 100,
              color: Colors.white,
            ),
            Row(
              children: [
                Container(
                  width: 80,
                ),
                CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                    child: Image.network('$profile_image_url'),
                  ),
                ),
                Text('$email')
              ],
            ),
            Container(
              height: 50,
            ),
            OutlinedButton(
              child: Text('About'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => about(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
            OutlinedButton(
              child: Text('Logout'),
              onPressed: (){
                LoginAPI.logOut;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => loginscreen(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
