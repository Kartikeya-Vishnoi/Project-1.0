import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import '../auth_form.dart';

class Auth_Screen extends StatefulWidget {
  const Auth_Screen({Key? key}) : super(key: key);

  @override
  State<Auth_Screen> createState() => _Auth_ScreenState();
}

class _Auth_ScreenState extends State<Auth_Screen> {
  final _auth = FirebaseAuth.instance;
  bool isloading = false;
  void submit_auth_form(String email, String password, String username,
      File userimg, bool islogin, BuildContext ctx) async {
    UserCredential authResult;
    try {
      setState(() {
        isloading = true;
      });
      if (islogin) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else if (!islogin) {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        final ref = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child(authResult.user.uid + '.jpg');
        ref.putFile(userimg);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user.uid)
            .set({'Username': username, 'email': email});
        setState(() {
          isloading = false;
        });
      }
    } on PlatformException catch (err) {
      setState(() {
        isloading = false;
      });
      String message = "An error occured Please check your credentials";
      if (err.message != null) {
        message = err.message!;
      }
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: auth_form(submit_auth_form, isloading));
  }
}


// rules_version= '2';
// service firebase.storage{
//   match /b/{bucket}/o{
//     match /{allPaths=**}{
//       allow read,create: if request.auth=!null;
//     }
//   }
// }


// {
//   "rules": {
//     ".read": false,
//     ".write": false
//   }
// }