// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hashtaglearning/services/post.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final PostService _postService = PostService();
  String text = '';

  String title = '';
  String description = '';
  String tags = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Post'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Form(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter Title",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      onChanged: (val) {
                        setState(() {
                          title = val;
                        });
                      }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 8,
                      maxLines: 8,
                      decoration: InputDecoration(
                        labelText: "Enter Description",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      onChanged: (val) {
                        setState(() {
                          description = val;
                        });
                      }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Attach Tags",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      onChanged: (val) {
                        setState(() {
                          tags = val;
                        });
                      }),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: ElevatedButton(
                        onPressed: () async {
                          _postService.savePost(title, description, tags);
                          Navigator.pop(context);
                        },
                        child: Text('Add Story')))
              ],
            ),
          ),
        ));
  }
}
