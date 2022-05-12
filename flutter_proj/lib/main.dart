import 'package:flutter/material.dart';

import './ques.dart';
import './answer.dart';
import './column.dart';
import './end.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Myappstate();
  }
}

class Myappstate extends State<Myapp> {
  var l = [
    {
      "QuestionText": "Which Colour will You choose out of these?",
      "Answers": [{"text":"Black", "score":10}, {"text":"Yellow","score":4}, {"text":"Red","score":7}, {"text":"White","score":1}]
    },
    {
      "QuestionText": "What is your favourite dish",
      "Answers": [
        {"text":"Chole-Bhature","score":4},
       {"text":"Chilli-Manchurian and Noodles","score":3},
       {"text":"Kadhai Paneer and Naan","score":5},
        {"text":"Pizza and Burger","score":6},
      ]
    },
    {
      "QuestionText": "What's your Favourite Sports",
      "Answers": [{"text":"Cricket", "score":1},{"text":"Football", "score":1} ,{"text":"Badminton", "score":2},{"text":"Lawn-Tennis", "score":4}] 
    },
  ];
  var q = 0;
  var score =0;
  void resetquiz(){
    setState(() {
    q=0;
    score=0;
    });
  }
  void que(int sc) {
    setState(() {
      q++;
      score+=sc;
      print(q);
    });
  }

  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("My APP"),
            ),
            body: q < l.length
                ?col(l: l, quefn: que, idx: q)
                : center(score,resetquiz),
                  )));
  }
}