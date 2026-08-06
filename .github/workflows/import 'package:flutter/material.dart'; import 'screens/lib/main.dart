import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const NumberShotAI());
}

class NumberShotAI extends StatelessWidget {
  const NumberShotAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Number Shot AI",
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
