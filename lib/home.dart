import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home screen",
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("나의 신고 처리 현황"),
            Table(
              children: <TableRow> [
                TableRow(
                  children: [
                    Center(
                      child: Text("총 신고 건수"),
                    ),
                    Center(
                      child: Text("진행"),
                    ),
                    Center(
                      child: Text("취하"),
                    ),
                    Center(
                      child: Text("답변완료"),
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    Center(
                      child: Text("00건"),
                    ),
                    Center(
                      child: Text("0건"),
                    ),
                    Center(
                      child: Text("0건"),
                    ),
                    Center(
                      child: Text("00건"),
                    ),
                  ]
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }



}
