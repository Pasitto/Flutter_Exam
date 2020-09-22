import 'package:flutter/material.dart';
import 'package:flutter_exam/data/person.dart';

class EditParameter{
  final int personid;
  const EditParameter(this.personid);
}

class EditScreen extends StatefulWidget {
  final int personid;
  EditScreen(this.personid);
  
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  
  String strscore;
  bool edit;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    
    if(widget.personid != -1){
      edit = true;
      _controller = TextEditingController(text: person[widget.personid].name);
      strscore = person[widget.personid].score.toString();
    }
      
    else{
      edit = false;
      _controller = TextEditingController();
      strscore = '0';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _buttonAction(String str){
    setState(() {
      if(str == '0' && strscore == '0'){
        //do noting
      }
      else if(str == 'CLR'){
        strscore = '0';
      }
      else if(str == 'OK'){
        if( _controller.text.isEmpty ){
          showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                title: Text('Error'),
                content: Text(
                  'Please fill in name.',
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
        else{
          if(edit){
            person[widget.personid].name = _controller.text;
            person[widget.personid].score = int.parse(strscore);
            Navigator.pop(context);
          }
          else{
            person.add(Person(_controller.text, int.parse(strscore)));
            Navigator.pop(context);
          }
        }
      }
      else if(str != '0' && strscore == '0'){
        strscore = str;
      }
      else{
        strscore += str;
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add or Edit'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 150,
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Name', style: TextStyle(fontSize: 30.0)),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _controller,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30.0)
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.cyanAccent,
              height: 100,
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(
                this.strscore,
                style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),                
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      customButton('7'),
                      customButton('8'),
                      customButton('9'),
                    ],
                  ),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      customButton('4'),
                      customButton('5'),
                      customButton('6'),
                    ],
                  ),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      customButton('1'),
                      customButton('2'),
                      customButton('3'),
                    ],
                  ),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      customButton('CLR'),
                      customButton('0'),
                      customButton('OK'),
                    ],
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }

  Widget customButton(String str){
    return Expanded(
      child: GestureDetector(
        child: Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.all(1),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1),
          ),
          child: Text(
            str,
            style: TextStyle(fontSize: 30),
          ),
        ),
        onTap: () => {_buttonAction(str)},
      ),
    );
  }
}

