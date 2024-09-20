import 'package:cloud_firestore/cloud_firestore.dart';

class Userview {
  Future<void> addTask(String taskName) async {
    if (taskName.isNotEmpty) {
      await FirebaseFirestore.instance.collection('tasks').add({
        'taskname': taskName,
        'isCompleted': false,
      });
    }
  }
}
