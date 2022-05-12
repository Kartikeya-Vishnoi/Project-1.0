import 'package:flutter/material.dart';

import './answer.dart';
import './main.dart';
import './ques.dart';

class col  extends StatelessWidget {
final List<Map<String,Object>> l;
final Function quefn;
final int idx;
col({@required this.l ,@required this.quefn,@required this.idx});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  quest(l[idx]['QuestionText'] as String),
                  ...(l[idx]["Answers"] as List<Map<String,Object>>).map((answer) {
                    return Answer(() =>quefn(answer["score"]), answer["text"]);
                  }).toList(),
                ],
              ) 
    ;
  }
}