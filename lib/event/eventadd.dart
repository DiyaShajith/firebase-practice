import 'package:cloud_firestore/cloud_firestore.dart';

class Eventadd {
  Future<String?> addEvent({
    required String title,
    required String description,
    required String date,
    required String loaction,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("event").add({
        "title": title,
        "description": description,
        "date": date,
        "location": loaction,
      });
      return "success";
    } catch (e) {
      return "Error adding";
    }
  }
}
