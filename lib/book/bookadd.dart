import 'package:cloud_firestore/cloud_firestore.dart';

class Bookadd {
  Future<String?> addBook({
    required String title,
    required String author,
    required String genre,
    required String isbn,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("book").add({
        "title_name": title,
        "author_name": author,
        "genre": genre,
        "isbn": isbn,
      });
      return "success";
    } catch (e) {
      return "Error adding";
    }
  }
}
