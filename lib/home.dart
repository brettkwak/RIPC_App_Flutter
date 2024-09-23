import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home screen",
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 100,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.campaign),
                        Text('공지사항'),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        Icon(Icons.assignment),
                        Text('앱 소개'),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info),
                        Text('서비스 개요'),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        Icon(Icons.support_agent),
                        Text('신고 절차 안내'),
                      ],
                    ),
                  ],
                ),
              ],
            )



          ],
        ),
      ),
    );
  }


  Widget count_bar(int count, double percentage){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: LinearProgressIndicator(
            value: percentage/100,
            color: Colors.blue,
            backgroundColor: Colors.white,
          ),
        ),

        SizedBox(width: 5,),
        Text('${percentage.round()} %'),
        SizedBox(width: 10,),
      ],
    );
  }


}
