import 'package:flutter/material.dart';

class history extends StatefulWidget {
  // const ({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {

  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  final _reportStatus = ['전체', '진행중', '취하', '답변완료'];
  final _searchType = ['주소', '차량번호'];
  String selectedReportStatus = "";
  String selectedSearchType = "";

  @override
  void initState(){
    super.initState();
    _startDateController.text = DateTime.now().subtract(const Duration(days: 30)).toString().split(" ")[0];
    _endDateController.text = DateTime.now().toString().split(" ")[0];

    selectedReportStatus = _reportStatus[0];
    selectedSearchType = _searchType[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child : Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    controller: _startDateController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 10,
                      ),
                      filled: false,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors. black)
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
                  padding: EdgeInsets.all(30),
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
            height: 30,
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
                    items: _reportStatus
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
