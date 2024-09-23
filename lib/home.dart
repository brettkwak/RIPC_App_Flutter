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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Color(0xff103C80),
              child:
                Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text("불법주정차 ",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.yellow,
                        ),
                      ),
                      Text("간편신고",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                    Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text("대신 ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )
                      ),
                      Text("신고해드립니다!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )
                      ),
                      ],
                    ),
                    Container(
                      height: 50,
                    ),
                    Container(
                      height: 150,
                      child: Image(
                          image: AssetImage('assets/3d_car.png'),
                      )
                    ),
              ],
            ),
            ),

            Container(
              child: Center(
                child: Text('24년 8월 신고 현황',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
                bottom: 10,
              ),
              child: Table(
                border: TableBorder.all(
                  borderRadius: BorderRadius.circular(2),
                ),
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
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.grey.shade500,
                ),
                children: [
                  TableRow(
                      children: [
                        Container(
                          child: Text("총 신고 (100건)"),
                          padding: EdgeInsets.only(left: 10),
                        ),
                        count_bar(100, 100),
                      ]
                  ),
                  TableRow(
                      children: [
                        Container(
                          child: Text("진행 (5건)"),
                          padding: EdgeInsets.only(left: 10),
                        ),
                        count_bar(5, 5),
                      ]
                  ),
                  TableRow(
                      children: [
                        Container(
                          child: Text("취하 (10건)"),
                          padding: EdgeInsets.only(left: 10),
                        ),
                        count_bar(10, 10),
                      ]
                  ),
                  TableRow(
                      children: [
                        Container(
                          child: Text("답변 완료 (85건)"),
                          padding: EdgeInsets.only(left: 10),
                        ),
                        count_bar(85, 85),
                      ]
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
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
                        Text('공지사항',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(Icons.assignment),
                        Text('앱 소개',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        )
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
                        Text('서비스 개요',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(Icons.support_agent),
                        Text('신고 절차 안내',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
