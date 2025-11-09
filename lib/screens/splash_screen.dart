/*
  MAD201 - Project 1
  Your Name - Ashishkumar Prajapati
  Splash screen
*/
import 'package:flutter/material.dart';
import 'home_dashboard.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeDashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text("Smart Budget Tracker Lite",
              style: TextStyle(fontSize: 24))),
    );
  }
}
