import 'package:cloud_firestore/cloud_firestore.dart';

class Recipeadd {
  Future<String?> addRecipe({
    required String recipename,
    required String ingredients,
    required String description,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("recipes").add({
        "recipe_name": recipename,
        "recipe_ingredients": ingredients,
        "recipe_description": description,
      });
      return "success";
    } catch (e) {
      return "Error adding";
    }
  }
}
