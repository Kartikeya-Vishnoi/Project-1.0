import 'package:flutter/material.dart';
import 'package:prac_1/TextControl.dart';

import './text.dart';
import './TextControl.dart';

void main() {
  runApp(Assignment());
}

class Assignment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AssignmentState();
  }
}

class AssignmentState extends State<Assignment> {
  String s = "HELLO";
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Assignment"),
      ),
      body: Container(
          margin: EdgeInsets.all(70),
          width: double.infinity,
          child: Column(
            children: [
              logic(),
            ],
          )),
    )));
  }
}
