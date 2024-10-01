import 'package:cloud_firestore/cloud_firestore.dart';

class Productadd {
  Future<String?> addProduct({
    required String name,
    required String category,
    required String price,
    required String stock,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("product").add({
        "name": name,
        "category": category,
        "price": price,
        "stock": stock,
      });
      return "success";
    } catch (e) {
      return "Error adding";
    }
  }

  Future<String?> updateproduct() async {
    try {
      await FirebaseFirestore.instance
          .collection("product")
          .doc("DAPpByrjlgEgtJVsxkcN")
          .update({
        "name": "fan",
        "category": "home utenils",
        "price": "800",
        "stock": "out of stock",
      });
      return "success";
    } catch (e) {
      return "Error adding";
    }
  }
}
