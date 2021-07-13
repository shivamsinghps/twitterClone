// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hashtaglearning/services/auth.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text("Homed"),
        actions: <Widget>[
          ElevatedButton.icon(
              onPressed: () async {
                _authService.signOutAction();
              },
              icon: Icon(Icons.person),
              label: Text('Sign Out'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addpost');
          },
          child: Icon(Icons.add)),
    );
  }
}
