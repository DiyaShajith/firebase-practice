import 'package:cloud_firestore/cloud_firestore.dart';

class Empadd {
  Future<String?> addEmp({
    required String name,
    required String position,
    required String salary,
    required String department,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("employee").add({
        "first_name": name,
        "position": position,
        "salary": salary,
        "dept_name": department,
      });
      return "success";
    } catch (e) {
      return "Error adding";
    }
  }
}
