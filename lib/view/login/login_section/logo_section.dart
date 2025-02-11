import 'dart:ui';
import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

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
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20), // Rounded corners for the container
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(20), // Same rounding for the ClipRRect
              child: Stack(
                children: [
                  // Background Frosted Glass Effect
                  BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 10.0, sigmaY: 10.0), // Blur effect
                    child: Container(
                      color: Colors.white.withOpacity(
                          0.1), // Slight transparency for the frosted glass effect
                    ),
                  ),
                  // Content (such as a Text or any other widget) on top of the frosted glass effect
                  Container(
                    color: Colors.white.withOpacity(
                        0.2), // A semi-transparent background to enhance the glass effect
                    child: Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.contain, // Use BoxFit here
                          width:
                              250, // Specify width and height to ensure it's circular
                          height: 250,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
