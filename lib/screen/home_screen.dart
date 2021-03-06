import 'package:flutter/material.dart';
import 'package:flutter_exam/config/routes.dart';
import 'package:flutter_exam/data/person.dart';
import 'package:flutter_exam/screen/detail_screen.dart';
import 'package:flutter_exam/screen/edit_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void refreshScreen(){
    setState(() {});
  }
 
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
              height: 150,
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.centerLeft,
              decoration: UnderlineTabIndicator(borderSide: BorderSide(width: 2.0)),
              child: Text(
                'My List',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 250,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: person.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    height: 80,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2.0), 
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        (index + 1).toString() + '    ' + person[index].name,
                        style: TextStyle(fontSize: 30.0),
                      ),
                      trailing: Text(
                      person[index].score.toString(),
                      style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                      ),
                      onTap: () => {
                        Navigator.of(context)
                        .pushNamed(AppRoutes.detail, arguments: DetailParameter(index))
                        .whenComplete(() => refreshScreen())
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          Navigator.of(context)
          .pushNamed(AppRoutes.edit, arguments: EditParameter(-1))
          .whenComplete(() => refreshScreen())
        },
      ),
    );
  }
}

// =================Old Version=====================
// class _ListView extends StatelessWidget {
//   void refreshScreen(){
//     setState(() {});
//   }
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.vertical,
//       itemCount: person.length,
//       itemBuilder: (BuildContext context, int index){
//         return DataCard(person[index], index, context);
//       },
//     );
//   }

//   Widget DataCard(Person data, int index, BuildContext context){
//     return GestureDetector(
//       child: Container(
//         padding: EdgeInsets.all(8.0),
//         decoration: UnderlineTabIndicator(borderSide: BorderSide(width: 1.0)),
//         child: Row(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.all(10.0),
//               alignment: Alignment.centerRight,
//               child: Text(
//                 (index + 1).toString(),
//                 style: TextStyle(fontSize: 30.0),
//               ),
//             ),
//             Container(
//               width: 270,
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 data.name,
//                 style: TextStyle(fontSize: 30.0),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 data.score.toString(),
//                 style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//       onTap: () => {
//         Navigator.of(context).pushNamed(AppRoutes.detail, arguments: DetailParameter(index)).whenComplete(() => refreshScreen())
//       },
//     ); 
//   }
// }

