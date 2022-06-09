import 'package:flutter/material.dart';

class auth_form extends StatefulWidget {
  const auth_form({Key? key}) : super(key: key);

  @override
  State<auth_form> createState() => _auth_formState();
}

class _auth_formState extends State<auth_form> {
  bool _login = true;
  final formKey = GlobalKey<FormState>();
  var _username = "";
  var _email = "";
  var _password = "";
  void _onsubmit() {
    FocusScope.of(context).unfocus();
    final key = formKey.currentState?.validate();
    if (key != null && key) {
      formKey.currentState!.save();
      print(_email);
      print(_username);
      print(_password);
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
                    TextFormField(
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
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                      onSaved: (value) {
                        _password = value.toString();
                      },
                    ),
                    SizedBox(height: 12),
                    RaisedButton(child: Text("Login"), onPressed: _onsubmit),
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
//Add Validators
//Initiate them using keys
//if valid ..then use the key to save details
//to save initiate onsaved method in each and store it in a variable 
//child:_login? Text("Create new Account") :Text("I already have an Account"