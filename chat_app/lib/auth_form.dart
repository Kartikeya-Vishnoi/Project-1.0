import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import './pickers/image_picker.dart';

class auth_form extends StatefulWidget {
  auth_form(this.submitfn, this.isloading);
  bool isloading;
  final void Function(
    String email,
    String password,
    String username,
    File _userimg,
    bool islogin,
    BuildContext ctx,
  ) submitfn;
  @override
  State<auth_form> createState() => _auth_formState();
}

//Add Validators
//Initiate them using keys
//if valid ..then use the key to save details
//to save initiate onsaved method in each and store it in a variable

class _auth_formState extends State<auth_form> {
  bool _login = true;
  final formKey = GlobalKey<FormState>();
  var _username = "";
  var _email = "";
  var _password = "";
  File? userimg;
  void picked_img(File img) {
    userimg = img;
  }

  void _onsubmit() {
    FocusScope.of(context).unfocus();
    //Validation of form starts
    final key = formKey.currentState?.validate();
    if (userimg == null && !_login) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Please choose an Image"),
        backgroundColor: Theme.of(context).errorColor,
      ));
    }

    if (key != null && key) {
      formKey.currentState!.save();
      widget.submitfn(
          _email.trim(), _password.trim(), _username.trim(),userimg!,_login, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!_login) user_image_picker(picked_img),
                    TextFormField(
                      key: ValueKey('EmailId'),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return "Please enter a valid gamil id";
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: "Email Address",
                      ),
                      onSaved: (value) {
                        _email = value.toString();
                      },
                    ),
                    if (!_login)
                      TextFormField(
                        key: ValueKey('Username'),
                        validator: (value) {
                          if (value!.length < 5 || value == null) {
                            return "Please Enter a valid User name";
                          }
                        },
                        onSaved: (value) {
                          _username = value.toString();
                        },
                        decoration: InputDecoration(labelText: "UserName"),
                      ),
                    TextFormField(
                      key: ValueKey('Password'),
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                      onSaved: (value) {
                        _password = value.toString();
                      },
                    ),
                    SizedBox(height: 12),
                    if (widget.isloading) CircularProgressIndicator(),
                    if (!widget.isloading)
                      RaisedButton(child: Text("Login"), onPressed: _onsubmit),
                    if (!widget.isloading)
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            _login = !_login;
                          });
                        },
                        textColor: Theme.of(context).primaryColor,
                        child: _login
                            ? Text("Create new Account")
                            : Text("I already have an Account"),
                      )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
