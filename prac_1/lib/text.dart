import 'package:flutter/material.dart';

class write  extends StatelessWidget {
  final String s;
  write(this.s);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(s),
    );
  }
}