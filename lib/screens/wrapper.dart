// ignore_for_file: unnecessary_null_comparison, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hashtaglearning/models/user.dart';
import 'package:hashtaglearning/screens/auth/signup.dart';
import 'package:hashtaglearning/screens/main/home.dart';
import 'package:hashtaglearning/screens/main/posts/add_post.dart';
import 'package:hashtaglearning/screens/main/profile/edit.dart';
import 'package:hashtaglearning/screens/main/profile/profile.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    print(user);
    if (user == null) {
      return SignUp();
    } else {
      return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/addpost': (context) => Add(),
          '/profile': (context) => ProfileSetup(),
          '/edit': (context) => Edit()
        },
      );
    }
  }
}
