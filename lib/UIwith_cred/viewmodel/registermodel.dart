import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_firebase/UIwith_cred/loginpage.dart';

class Registermodel {
  final auth = FirebaseAuth.instance;
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

  Future register(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Email already in use")));
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Loginpage(),
              ));
        },
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          if (context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Invaid email")));
          }
        case "email-already-in-use":
          if (context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Email already in use")));
          }
        case "weak-password":
          if (context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("weak password used")));
          }
        case "operation-not-allowed":
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("operations are not allowed")));
          }
        default:
      }
    }
  }
}
