import 'package:cloud_firestore/cloud_firestore.dart';

class Movieadd {
  Future<String?> addMovie({
    required String title,
    required String director,
    required String year,
    required String rating,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("movie").add({
        "title_name": title,
        "director": director,
        "year": year,
        "rating": rating,
      });
      return "success";
    } catch (e) {
      return "Error adding";
    }
  }
  Future<String?> updateMovie(
     String title,
    
    String docid,
  ) async {
    try {
      await FirebaseFirestore.instance.collection("movie").doc(docid).update(
        {
        "title_name": title,
        
      }
      );
      return "success";
    } catch (e) {
      return "Error adding";
    }
  }
}
