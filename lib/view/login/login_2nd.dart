import 'dart:ui';
import 'package:amlamrut/view/login/login_section/login_section.dart';
import 'package:amlamrut/view/login/login_section/logo_section.dart';
import 'package:amlamrut/view/login/login_section/logo_section_without_glass.dart';
import 'package:flutter/material.dart';

class Login2nd extends StatelessWidget {
  const Login2nd({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    // Define scaling factors based on screen width
    double containerWidth = screenWidth * 0.9; // 90% of the screen width
    double containerHeight = screenHeight * 0.7; // 70% of the screen height
    double padding =
        screenWidth < 600 ? 16.0 : 20.0; // Adjust padding for smaller screens

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFabecd6), // #abecd6
              Color(0xFFfbed96), // #fbed96
            ],
            stops: [0.0, 1.0], // Gradient start and end points
          ),
        ),
        child: Center(
          child: Container(
            width: containerWidth, // Use calculated width
            height: containerHeight, // Use calculated height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.2), // Shadow color with opacity
                  offset: Offset(10, 10), // Position of the shadow
                  blurRadius: 20, // How blurry the shadow is
                  spreadRadius: 5, // How much the shadow spreads
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Light shadow effect
                  offset: Offset(
                      -1, -1), // Opposite direction for a more subtle 3D effect
                  blurRadius: 25,
                  spreadRadius: 1,
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFabecd6), // #abecd6
                  Color(0xFFfbed96), // #fbed96
                ],
                stops: [0.0, 1.0], // Gradient start and end points
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center children on larger screens
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Adjust widgets for responsiveness
                Expanded(
                  flex: screenWidth < 600
                      ? 0
                      : 1, // Make logo section take less space on small screens
                  child: LogoSectionWithoutGlass(),
                ),
                Expanded(
                  flex: 1,
                  child: LoginSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
