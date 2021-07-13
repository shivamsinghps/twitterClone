import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String? id;
  final String? creator;
  final String? title;
  final String? description;
  final String? tags;
  final Timestamp? timestamp;

  PostModel({
    this.id,
    this.creator,
    this.title,
    this.description,
    this.tags,
    this.timestamp,
  });
}
