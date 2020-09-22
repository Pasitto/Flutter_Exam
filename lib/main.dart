import 'package:flutter/material.dart';
import 'package:flutter_exam/config/routes.dart';
import 'package:flutter_exam/screen/detail_screen.dart';
import 'package:flutter_exam/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Score Lists',
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
      },
      onGenerateRoute: _registerRWP,
    );
  }
}

Route _registerRWP(RouteSettings settings){
  if(settings.name == AppRoutes.detail){
    return MaterialPageRoute(builder: (context){
        DetailParameter param = settings.arguments;
        return DetailScreen(param.person_id);
    });
  }
}