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
