import 'package:flutter/material.dart';

import '../auth_form.dart';

class Auth_Screen extends StatefulWidget {
  const Auth_Screen({ Key? key }) : super(key: key);

  @override
  State<Auth_Screen> createState() => _Auth_ScreenState();
}

class _Auth_ScreenState extends State<Auth_Screen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:auth_form()
    );
  }
}