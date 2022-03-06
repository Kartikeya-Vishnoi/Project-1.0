import 'package:flutter/material.dart';

class quest extends StatelessWidget {
  final String str;
  quest(this.str);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Text(
          str,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}
