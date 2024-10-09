import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginmodel {
  Future login(
    String email,
    String password,
    String phone,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login Successfully")));
      });
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case "wrong-password":
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("wrong password is used")));
          }
        case "invalid-email":
          if (context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("invalid email is used")));
          }
        case "user-disabled":
          if (context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("user is diabled")));
          }
        case "user-not-found":
          if (context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("user is not found")));
          }
        case "invalid-credential":
          if (context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("credential not found")));
          }

        default:
      }
    }
  }
}
