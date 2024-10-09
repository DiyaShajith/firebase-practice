import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetReg extends StatefulWidget {
  const GetReg({super.key});

  @override
  State<GetReg> createState() => _GetRegState();
}

class _GetRegState extends State<GetReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("register")
            .orderBy("user_name", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("no register found"),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs[index];
                return ListTile(
                  title: Text(data["user_name"]),
                  subtitle: Text(data["e_mail"]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
