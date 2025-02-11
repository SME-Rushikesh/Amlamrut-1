import 'dart:ui';

import 'package:amlamrut/view/login/login_2nd.dart';
import 'package:amlamrut/view/new_sales/leftsection.dart';
import 'package:amlamrut/view/new_sales/rightsection.dart';
import 'package:flutter/material.dart';

class NewSalesPage extends StatefulWidget {
  @override
  State<NewSalesPage> createState() => _NewSalesPageState();
}

class _NewSalesPageState extends State<NewSalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomAppBar(),
      body: SafeArea(
          child: Row(
        children: [
          ProductSelection(),
          CustomerSelection(),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     decoration:
          //         BoxDecoration(border: Border.all(color: Colors.black)),
          //     child: Column(
          //       children: [
          //         Expanded(
          //           child: Container(
          //             decoration: BoxDecoration(
          //                 border: Border.all(color: Colors.black)),
          //           ),
          //         ),
          //         Expanded(
          //           child: Container(
          //             decoration: BoxDecoration(
          //                 border: Border.all(color: Colors.black)),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      )),
    );
  }

  /// Custom AppBar with a smooth gradient, logo, and logout button
  PreferredSizeWidget _buildCustomAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF56AB2F),
                    Color(0xFFA8E063)
                  ], // Smooth green gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Logo (Leading)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10), // Space between logo and text

                  // Dashboard Title
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New Sales",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Spacer to push the icon to the right
                  const Spacer(),
                  // Welcome Text
                  const Text(
                    "Welcome, User",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Logout Icon
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login2nd()),
                      );
                    },
                    child: _buildIcon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Icon(icon, color: Colors.black),
    );
  }
}
