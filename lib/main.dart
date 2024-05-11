import 'package:flutter/material.dart';
import 'package:mybag_assignment/home_screen.dart';

void main() {
  runApp(const MyBag());
}

class MyBag extends StatelessWidget {
  const MyBag({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
