import 'package:flutter/material.dart';
import 'package:todo_with_firebase/recipe/viewmodel/recipeadd.dart';

class RecipeDat extends StatefulWidget {
  const RecipeDat({super.key});

  @override
  State<RecipeDat> createState() => _RecipeDatState();
}

class _RecipeDatState extends State<RecipeDat> {
  final TextEditingController _recipename = TextEditingController();
  final TextEditingController _ingredientsname = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? recipename;
  String? ingredients;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recipes",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _recipename,
                decoration: const InputDecoration(
                    labelText: "Recipe Name",
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter recipe name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    recipename = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _ingredientsname,
                maxLines: 2,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Ingredients",
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ingredient name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    ingredients = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _description,
                maxLines: 5,
                maxLength: 5000,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Description",
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder()),
                onPressed: () {
                  Recipeadd().addRecipe(
                      recipename: _recipename.text,
                      ingredients: _ingredientsname.text,
                      description: _description.text);
                  if (recipename != null &&
                      ingredients != null &&
                      description != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                        "Recipe Added!",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      )),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                        "Please fill all fields!",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      )),
                    );
                  }
                },
                child: const Text(
                  "Save Recipe",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
