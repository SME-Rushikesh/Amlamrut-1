import 'dart:ui';
import 'package:amlamrut/view/customer/customer.dart';
import 'package:amlamrut/view/login/login_2nd.dart';
import 'package:amlamrut/view/new_sales/new_sales_page.dart';
import 'package:amlamrut/view/record_screen/sales_record.dart';
import 'package:amlamrut/view/returns/returns.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC8F5E6), // Light pastel green background

      appBar: _buildCustomAppBar(),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildCard(
                    title: 'New Sales',
                    icon: Icons.shopping_bag_outlined,
                    page: NewSalesPage(),
                    containerColor: Colors.amber[700]!, // Dark Yellow
                    iconBgColor: Colors.white,
                    iconColor: Colors.green[800]!, // Deep Green
                  ),
                  SizedBox(width: 15),
                  _buildCard(
                    title: 'Sales Records',
                    icon: Icons.receipt_long,
                    page: SalesRecord(),
                    containerColor: Colors.green[700]!, // Deep Green
                    iconBgColor: Colors.white,
                    iconColor: Colors.amber[900]!, // Golden Yellow
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _buildCard(
                    title: 'Returns',
                    icon: Icons.autorenew,
                    page: ReturnsPage(),
                    containerColor: Colors.orange[600]!, // Warm Orange
                    iconBgColor: Colors.white,
                    iconColor: Colors.green[800]!, // Dark Green
                  ),
                  SizedBox(width: 15),
                  _buildCard(
                    title: 'Customers',
                    icon: Icons.people_alt_outlined,
                    page: CustomerPage(),
                    containerColor:
                        Colors.brown[400]!, // Earthy Brown for contrast
                    iconBgColor: Colors.white,
                    iconColor: Colors.amber[700]!, // Warm Yellow
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
                        "Dashboard",
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

  /// Custom rounded icon button
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

  Widget _buildCard({
    required IconData icon,
    required String title,
    required Widget page,
    required Color containerColor, // Background color for the card
    required Color iconBgColor, // Background color for the icon
    required Color iconColor, // Icon color
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Container(
          height: 180,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: containerColor, // Dynamic card background color
            borderRadius: BorderRadius.circular(20), // Smooth rounded edges
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Outer shadow
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(4, 4),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.8), // Inner shadow for depth
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(-4, -4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular Icon Background
              Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: iconBgColor, // Custom background for icon
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: iconColor.withOpacity(0.3), // Subtle glow effect
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: 60,
                  color: iconColor, // Dynamic icon color
                ),
              ),
              const SizedBox(height: 10),
              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Consistent text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
