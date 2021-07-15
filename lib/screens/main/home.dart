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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('drawer header'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('Edit'),
              onTap: () {
                Navigator.pushNamed(context, '/edit');
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                _authService.signOutAction();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addpost');
          },
          child: Icon(Icons.add)),
    );
  }
}
