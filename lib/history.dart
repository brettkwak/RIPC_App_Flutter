import 'package:flutter/material.dart';

class history extends StatefulWidget {
  // const ({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {

  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          children: [
            Expanded(
              child : Padding(
                padding: EdgeInsets.all(30),
                child: TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'START DATE',
                    filled: false,
                    prefixIcon: Icon(Icons.calendar_today),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors. black)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                    )
                  ),
                  readOnly: true,
                  onTap: (){
                    _selectDate();
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                      labelText: 'END DATE',
                      filled: false,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)
                      )
                  ),
                  readOnly: true,
                  onTap: (){
                    _selectDate();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async{
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100)
    );

    if (_picked != null){
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

}
