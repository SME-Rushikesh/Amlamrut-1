import 'dart:ui';
import 'package:flutter/material.dart';

class LogoSectionWithoutGlass extends StatelessWidget {
  const LogoSectionWithoutGlass({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFd4fc79), // #d4fc79
              Color(0xFF96e6a1), // #96e6a1
            ],
            stops: [0.0, 1.0], // Gradient start and end points
          ),
        ),
        child: Center(
          child: ClipOval(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain, // Use BoxFit here
              width: 250, // Specify width and height to ensure it's circular
              height: 250,
            ),
          ),
        ),
      ),
    );
  }
}
