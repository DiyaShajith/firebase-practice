import 'package:cloud_firestore/cloud_firestore.dart';

class Registermodel {
  Future addReg(
    String email,
    String username,
    String password,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection("register")
          .add({"e_mail": email, "user_name": username, "password": password});
    } catch (e) {}
  }
}
