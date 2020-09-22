import 'package:flutter/material.dart';
import 'package:flutter_exam/config/routes.dart';
import 'package:flutter_exam/data/person.dart';
import 'package:flutter_exam/screen/edit_screen.dart';

int findNext(int curid){
  int findid, min, temp;
  bool flag = false;
  List<int> scoredif = [];
  for(int i=0; i<person.length; i++){
    temp = person[i].score - person[curid].score;
    if(temp > 0){
      min = temp;
      flag = true;
    }
    scoredif.add(temp);
  }
  if(!flag)
    return -1;

  for(int i=0; i<person.length; i++){
    if(min >= scoredif[i] && scoredif[i] > 0){
      min = scoredif[i];
      findid = i;
    }
  }
  return findid;
}

class DetailParameter{
  final int personid;
  const DetailParameter(this.personid);
} 

class DetailScreen extends StatefulWidget {
  int personid;
  DetailScreen(this.personid);
  
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  int nextid;
  @override
  void initState() {
    super.initState();
    this.nextid = findNext(widget.personid);
  }

  void nextPersonScreen(){
    setState(() {
      widget.personid = this.nextid;
      this.nextid = findNext(widget.personid);
    });
  }

  void refreshScreen(){
    setState(() {
      this.nextid = findNext(widget.personid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration( 
                color: Colors.lightBlueAccent,
                border: Border(
                  bottom: BorderSide(width: 2.0),
                ),
              ),
              child: ListTile(
                title: Text(
                  (widget.personid + 1).toString() + '    ' + person[widget.personid].name,
                  style: TextStyle(fontSize: 30.0),
                ),
                trailing: Text(
                  person[widget.personid].score.toString(),
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 350,
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Next Person >', 
                    style: TextStyle(fontSize: 55.0),
                  ),
                  this.nextid != -1 ?
                  ListTile(
                    title: Text(
                      (this.nextid + 1).toString() + '    ' + person[this.nextid].name,
                      style: TextStyle(fontSize: 30.0),
                    ),
                    trailing: Text(
                      person[this.nextid].score.toString(),
                      style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => {nextPersonScreen()},                    
                  )
                  : Text(
                    "don't have a greater than score", 
                    style: TextStyle(fontSize: 25.0, color: Colors.red),
                  ),
                ],
              ) 
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.edit),
        onPressed: () => {  
          Navigator.of(context).pushNamed(AppRoutes.edit, arguments: EditParameter(widget.personid)).whenComplete(() => refreshScreen())
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}