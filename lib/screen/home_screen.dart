import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.centerLeft,
              decoration: UnderlineTabIndicator(borderSide: BorderSide(width: 1.0)),
              child: Text(
                'My List',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: _ListView(),
            ),
             
            
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
    
  }
}

class _ListView extends StatelessWidget {
  
  //initial List 
  final _dataList = [
    {
      'num': 1,
      'name' : 'JJ',
      'val' : 80,
    },
    {
      'num': 2,
      'name' : 'Poon',
      'val' : 77,
    },
    {
      'num': 3,
      'name' : 'Geng',
      'val' : 85,
    },
    {
      'num': 4,
      'name' : 'John',
      'val' : 60,
    },
  ];
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _dataList.length,
      itemBuilder: (BuildContext context, int index){
        return DataCard(_dataList[index]);
      },
    );
  }

  Widget DataCard(Map<String, Object> data){
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: UnderlineTabIndicator(borderSide: BorderSide(width: 1.0)),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.centerRight,
            child: Text(
              data['num'].toString(),
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          Container(
            width: 280,
            alignment: Alignment.centerLeft,
            child: Text(
              data['name'],
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              data['val'].toString(),
              style: TextStyle(fontSize: 50.0),
            ),
          )
          
        ],
      ),
    );
  }
}

