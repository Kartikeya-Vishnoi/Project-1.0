import 'package:flutter/material.dart';
import './text.dart';
class logic extends StatefulWidget {


  @override
  State<StatefulWidget> createState(){
    return logicState();
  }
}

class logicState extends State<logic> {
  String s="HI";   
  @override
  Widget build(BuildContext context) {
    write(s);
    return Column(
      children:[ RaisedButton(
                  child: write("CLICK TO SEE"),
                  onPressed: (() => setState(() {
                        if (s == "HI") {
                          s = "GOODBYE";
                        } else {
                          s = "HI";
                        }
                      }))),write(s)],
                      
    );
  }
}