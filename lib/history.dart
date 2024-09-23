import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class history extends StatefulWidget {
  // const ({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {

  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  final _reportSearchStatus = ['전체', '진행중', '취하', '답변완료'];
  final _searchType = ['주소', '차량번호'];
  String selectedReportStatus = "";
  String selectedSearchType = "";

  final int itemCount = 0;


  @override
  void initState(){
    super.initState();
    _startDateController.text = DateTime.now().subtract(const Duration(days: 30)).toString().split(" ")[0];
    _endDateController.text = DateTime.now().toString().split(" ")[0];

    selectedReportStatus = _reportSearchStatus[0];
    selectedSearchType = _searchType[0];
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 40  ,
          ),
          Row(
            children: [
              Expanded(
                child : Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _startDateController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 10,
                      ),
                      filled: false,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                      )
                    ),
                    readOnly: true,
                    onTap: (){
                      _selectStartDate();
                    },
                  ),
                ),
              ),
              Container(
                child: Text("~"),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _endDateController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        filled: false,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)
                        )
                    ),
                    readOnly: true,
                    onTap: (){
                      _selectEndDate();
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 0,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment(0, 0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12)
                    ),
                    value: selectedReportStatus,
                    items: _reportSearchStatus
                        .map((e) => DropdownMenuItem(
                          value: e, // 선택 시 onChanged 를 통해 반환할 value
                          child: Text(e),
                        ))
                        .toList(),
                    onChanged: (value) { // items 의 DropdownMenuItem 의 value 반환
                      setState(() {
                        selectedReportStatus = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment(0, 0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12)
                    ),
                    value: selectedSearchType,
                    items: _searchType
                        .map((e) => DropdownMenuItem(
                          value: e, // 선택 시 onChanged 를 통해 반환할 value
                          child: Text(e),
                        ))
                        .toList(),
                    onChanged: (value) { // items 의 DropdownMenuItem 의 value 반환
                      setState(() {
                        selectedSearchType = value!;
                      });
                    },
                  ),
                ),
              ),
            ]
          ),
          Container(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                  )
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '검색어를 입력하세요.',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric( horizontal: 12)
                          ),

                        )
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.search),
                    ),
                  ],
                ),
              )
          ),
          Text("나의 신고 처리 현황"),
          Container(
            padding: EdgeInsets.all(10),
            child: Table(
              border: TableBorder.all(
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
          Expanded(
              child: FutureBuilder(
                future: loadCSV(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    final items = snapshot.data!;
                    return Scrollbar(
                      thickness: 10,
                      interactive: true,
                      thumbVisibility: true,
                      radius: Radius.circular(10),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: items.map((item) {
                            return Column(
                              children: [
                                ListTile(
                                  title: Container(
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage(item['image_path']!),
                                          width: 70,
                                          height: 70,

                                          errorBuilder: (context, error, stackTrace) {
                                            print('Loading image from: ${item['image_path']}');
                                            print('Error loading image: ${item['image_path']}');
                                            return const Icon(Icons.error); // Fallback icon
                                          }
                                        ),
                                        SizedBox(width: 30),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('시간: ${item['report_time']}'),
                                            Text('위치: ${item['report_location']}'),
                                            Text('상태: ${item['report_status']}'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    );


                  } else
                    {
                      return Center(
                        child: Text('No Data Found :/'),
                      );
                    }
                }
              )
          ),
        ]
      ),
    );
  }

  Future<void> _selectStartDate() async{
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
    );

    if (_picked != null){
      setState(() {
        _startDateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectEndDate() async{
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
    );

    if (_picked != null){
      setState(() {
        _endDateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

}

Future<List<Map<String, String>>> loadCSV() async {
  try {
    final String data = await rootBundle.loadString('assets/data.csv');
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(data);

    // Convert the CSV data into a list of maps
    List<Map<String, String>> items = [];
    for (var i = 1; i < csvTable.length; i++) {
      print("Row $i : ${csvTable[i]}");
      items.add({
        'vehicle_number': csvTable[i][0].toString(),
        'report_time': csvTable[i][1].toString(),
        'report_location': csvTable[i][2].toString(),
        'image_path': csvTable[i][3].toString(),
        'report_status': csvTable[i][4].toString(),
      });
    }
    return items;
  } catch (e){
    print("Error loading CSV $e");
    return[];
  }
}