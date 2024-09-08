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
              border: TableBorder.all(),
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
            Container(
              height: 100,
              color: Colors.white,
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    Text("신고 (100건)"),
                    count_bar(100, 100),
                  ]
                ),
                TableRow(
                    children: [
                      Text("진행 (5건)"),
                      count_bar(5, 5),
                    ]
                ),
                TableRow(
                    children: [
                      Text("취하 (10건)"),
                      count_bar(10, 10),
                    ]
                ),
                TableRow(
                    children: [
                      Text("답변 완료 (85건)"),
                      count_bar(85, 85),
                    ]
                ),
              ],
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
