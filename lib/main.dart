/*
 MAD201 - Project 1
  Your Name - Ashishkumar Prajapati
  App entry point
*/
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const BudgetTrackerApp());
}

class BudgetTrackerApp extends StatelessWidget {
  const BudgetTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Budget Tracker Lite',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
