import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task2/Screens/HomeScreen.dart';
import 'package:task2/Screens/SignUp.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const task2());
}

class task2 extends StatelessWidget {
  const task2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: SignUp(),
    );
  }
}
