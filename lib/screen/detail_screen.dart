import 'package:flutter/material.dart';
import 'package:flutter_exam/data/person.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(person[widget.person_id].name),
    );
  }
}