import 'package:flutter/material.dart';
import 'package:todo_with_firebase/book/bookview.dart';
import 'package:todo_with_firebase/employeeform/emp.dart';
import 'package:todo_with_firebase/event/eventview.dart';
import 'package:todo_with_firebase/movie/movieview.dart';
import 'package:todo_with_firebase/recipe/recipeview.dart';
import 'package:todo_with_firebase/registerform/registerview.dart';
import 'package:todo_with_firebase/view/todo_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const EventView(),
    );
  }
}
