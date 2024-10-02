import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetReg extends StatefulWidget {
  const GetReg({super.key});

  @override
  State<GetReg> createState() => _GetRegState();
}

class _GetRegState extends State<GetReg> {
  String docid = "zaFEkOV2GXz2xQ6ypBj0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("register")
            .doc(docid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.data() == null) {
            return const Center(
              child: Text("no register found"),
            );
          } else {
            return ListTile(
              title: Text(snapshot.data!["user_name"]),
              subtitle: Text(snapshot.data!["e_mail"]),
            );
          }
        },
      ),
    );
  }
}
