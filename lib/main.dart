import 'package:flutter/material.dart';
import 'package:task2/Screens/HomeScreen.dart';

void main() {
  runApp(const task2());
}

class task2 extends StatelessWidget {
  const task2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: HomeScreen(),
    );
  }
}
