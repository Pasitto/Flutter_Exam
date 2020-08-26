import 'package:flutter/material.dart';
import 'package:flutter_exam/config/routes.dart';
import 'package:flutter_exam/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Score Lists',
      //home: HomeScreen(), is optional
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
        //AppRoutes.pageA: (context) => PageAScreen(),
        //AppRoutes.pageB: (context) => PageBScreen(),
      },
      //onGenerateRoute: _registerRWP,
    );
  }
}
