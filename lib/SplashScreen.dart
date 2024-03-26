import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'DashboardScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ));
    });
  }


    @override
    Widget build(BuildContext context) {
      return AnimatedSplashScreen(
        splash: 'images/splash.png',
        nextScreen: DashboardScreen(),
        splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
      );
    }
    /*return Scaffold(

      backgroundColor: Colors.cyan,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Icon(
              Icons.sports_gymnastics_outlined,
              size: 150,
            )),
            Center(
              child: Text(
                'BMI Calculator',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );*/
  }

