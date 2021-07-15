// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:hashtaglearning/models/post.dart';
import 'package:provider/provider.dart';

class ListPost extends StatefulWidget {
  const ListPost({Key? key}) : super(key: key);

  @override
  _ListPostState createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<PostModel>>(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        final post = posts[index];
        return Container(
          padding: EdgeInsets.all(20),
          color: Colors.black12,
          child: Column(children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text('Title' + (post.title ?? ''))),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text('Story' + (post.description ?? ''))),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text('Tags' + (post.tags ?? ''))),
          ]),
        );
      },
      itemCount: posts.length,
    );
  }
}
