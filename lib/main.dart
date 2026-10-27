
import 'package:flutter/material.dart';
import 'package:pf2/screens/home_screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DevProfile M3',
      home: HomeScreen(),
    );
  }
}