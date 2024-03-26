import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My BMI Calculator',
      theme: ThemeData(
      primarySwatch: Colors.lime,
      ),
      home: const SplashScreen(),
    );
  }
}