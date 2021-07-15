import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hashtaglearning/models/post.dart';

class PostService {
  List<PostModel> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PostModel(
        id: doc.id,
        title: (doc.data() as dynamic)['title'] ?? '',
        description: (doc.data() as dynamic)['description'] ?? '',
        tags: (doc.data() as dynamic)['tags'] ?? '',
        creator: (doc.data() as dynamic)['creator'] ?? '',
        timestamp: (doc.data() as dynamic)['timestamp'] ?? '',
      );
    }).toList();
  }

  Future savePost(title, description, tags) async {
    await FirebaseFirestore.instance.collection("post").add({
      'title': title,
      'description': description,
      'tags': tags,
      'creator': FirebaseAuth.instance.currentUser!.uid,
      'timestamp': FieldValue.serverTimestamp(),
      'retweet': false
    });
  }

  Stream<List<PostModel>> getPostsByUser(uid) {
    return FirebaseFirestore.instance
        .collection("post")
        .where('creator', isEqualTo: uid)
        .snapshots()
        .map(_postListFromSnapshot);
  }
}
