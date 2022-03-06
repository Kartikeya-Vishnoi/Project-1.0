import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback fn;
  final String ans;
  Answer(this.fn, this.ans);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(ans),
        onPressed: fn,
      ),
    );
  }
}
