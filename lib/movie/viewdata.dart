import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_firebase/movie/movieadd.dart';

class Viewdata extends StatefulWidget {
  const Viewdata({super.key});

  @override
  State<Viewdata> createState() => _ViewdataState();
}

class _ViewdataState extends State<Viewdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("movie").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("movie is not found"),
          );
        } else {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                    title: Text(data["title_name"] ?? ""),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data["director"] ?? ""),
                        Text(data["rating"])
                      ],
                    ),
                    trailing: Text(data["year"] ?? ""),
                    leading: IconButton(
                        onPressed: () {
                          Movieadd().updateMovie("HoneyBee", data.id);
                        },
                        icon: const Icon(Icons.edit)),
                  ),
                );
              });
        }
      },
    ));
  }
}
