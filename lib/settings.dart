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
    String? user_name = user_data().user_name;

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
                  width: 40,
                ),
                CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                    child: Image.network('$profile_image_url'),
                  ),
                ),
                Container(
                  width: 20,
                ),
                // Text('$email'),
                Text('$user_name'),

                Container(
                  width: 80,
                ),
                ElevatedButton.icon(
                  icon: Image.asset(
                    'assets/google_logo.png', // Path to your Google logo
                    height: 20, // Height for the logo
                    width: 20,  // Width for the logo
                  ),
                  onPressed: (){},
                  label: Text('계정 관리'),

                  // style: ElevatedButton.styleFrom(
                  //   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12)
                  // ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.grey),
                  ),
                )
              ],
            ),
            Container(
              height: 50,
            ),
            Divider(
              color: Colors.grey[400],
            ),
            Expanded(
                child:
                  ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.campaign),
                        title: Text('공지사항'),

                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: Icon(Icons.help_outline),
                        title: Text('문의하기'),
                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: Icon(Icons.group),
                        title: Text('개발자 정보'),
                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: Icon(Icons.assignment),
                        title: Text('이용약관'),
                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('앱 설정'),
                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      ListTile(
                        leading: Icon(Icons.info_outline),
                        title: Text('앱 정보'),
                        trailing: Text('1.0.0', style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  ),
            ),


            // OutlinedButton(
            //   child: Text('About'),
            //   onPressed: (){
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => about(),
            //       ),
            //     );
            //   },
            //   style: OutlinedButton.styleFrom(
            //     foregroundColor: Colors.black,
            //   ),
            // ),
            // OutlinedButton(
            //   child: Text('Logout'),
            //   onPressed: (){
            //     LoginAPI.logOut;
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => loginscreen(),
            //       ),
            //     );
            //   },
            //   style: OutlinedButton.styleFrom(
            //     foregroundColor: Colors.red,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
