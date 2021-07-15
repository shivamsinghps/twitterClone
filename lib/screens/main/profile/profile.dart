// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hashtaglearning/models/post.dart';
import 'package:hashtaglearning/screens/main/posts/list.dart';
import 'package:hashtaglearning/services/post.dart';
import 'package:provider/provider.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({Key? key}) : super(key: key);

  @override
  _ProfileSetupState createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PostModel>>.value(
      value:
          _postService.getPostsByUser(FirebaseAuth.instance.currentUser?.uid),
      initialData: [],
      child: Scaffold(
        body: ListPost(),
      ),
    );
  }
}
