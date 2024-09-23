import 'package:cloud_firestore/cloud_firestore.dart';

class Registeradd {
  Future<String?> addDet({
    required String firstname,
    required String lastname,
    required String classname,
    required String age,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("student").add({
        "first_name": firstname,
        "last_name": lastname,
        "class_name": classname,
        "agestd": age,
        "emailid": email,
        "passswordstd": password,
      });
      return "success";
    } catch (e) {
      return "Error adding";
    }
  }
}
