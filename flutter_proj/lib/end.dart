import 'package:flutter/material.dart';

class center extends StatelessWidget {
  final int ts;
  final Function reset;
  String phrase;
  String get resultphrase {
    phrase = "You did it";
    if (ts <= 8) {
      phrase = "You are Awsome";
    } else if (ts <= 12) {
      phrase = "You are Pretty Likable";
    } else if (ts <= 16) {
      phrase = "You are....Strange?!";
    } else {
      phrase = "You are Bad";
    }
    return phrase;
  }

  center(this.ts,this.reset);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text(resultphrase,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            FlatButton(onPressed: reset, child: Text("Restart Quiz"),textColor: Colors.blue,)    
          ],
        ));
  }
}
