// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hashtaglearning/services/auth.dart';

// ignore: use_key_in_widget_constructors
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            elevation: 5,
            title: const Text("Sign Up")),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  onChanged: (val) => setState(() {
                    email = val;
                  }),
                ),
                TextFormField(
                  onChanged: (val) => setState(() {
                    password = val;
                  }),
                ),
                ElevatedButton(
                  child: const Text('SignUp'),
                  onPressed: () async =>
                      {_authService.signUpAction(email, password)},
                ),
                ElevatedButton(
                  child: const Text('SignIn'),
                  onPressed: () async =>
                      {_authService.signInAction(email, password)},
                ),
              ],
            ),
          ),
        ));
  }
}
