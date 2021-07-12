// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:hashtaglearning/models/user.dart';
import 'package:hashtaglearning/screens/auth/signup.dart';
import 'package:hashtaglearning/screens/main/home.dart';
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
      return const Home();
    }
  }
}
