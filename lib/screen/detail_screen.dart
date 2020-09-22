import 'package:flutter/material.dart';
import 'package:flutter_exam/config/routes.dart';
import 'package:flutter_exam/data/person.dart';

int findNext(int cur_id){
  int find_id, min, temp;
  bool flag = false;
  List<int> scoredif = [];
  for(int i=0; i<person.length; i++){
    temp = person[i].score - person[cur_id].score;
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
      find_id = i;
    }
  }
  return find_id;
}

class DetailParameter{
  final int person_id;
  const DetailParameter(this.person_id);
} 

class DetailScreen extends StatefulWidget {
  final int person_id;
  DetailScreen(this.person_id);
  
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  int next_id;
  @override
  void initState() {
    super.initState();
    next_id = findNext(widget.person_id);
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
                  (widget.person_id + 1).toString() + '    ' + person[widget.person_id].name,
                  style: TextStyle(fontSize: 30.0),
                ),
                trailing: Text(
                  person[widget.person_id].score.toString(),
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
                  this.next_id != -1 ?
                  ListTile(
                    title: Text(
                      (this.next_id + 1).toString() + '    ' + person[this.next_id].name,
                      style: TextStyle(fontSize: 30.0),
                    ),
                    trailing: Text(
                      person[this.next_id].score.toString(),
                      style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                    ),
                    onTap: () => {Navigator.of(context).pushNamed(AppRoutes.detail, arguments: DetailParameter(this.next_id))},                    
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
        onPressed: () => {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}