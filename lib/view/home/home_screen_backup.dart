import 'package:amlamrut/view/login/login_2nd.dart';
import 'package:amlamrut/view/home/main_section/left_section.dart';
import 'package:amlamrut/widget/footer.dart';
import 'package:amlamrut/widget/selection.dart';
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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              width: 40,
              height: 40,
            ),
          ),
        ),
        title: Text(
          "Billing Dashboard",
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFF96e6a1), // Soft green for a calm look
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200, // Increased width for better spacing
              height: 50, // Adjusted height for a balanced look
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor:
                          Colors.blueAccent[100], // Softer color tone
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: 10), // Better spacing
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User Name", // Example name instead of 'User'
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Admin", // Example user role
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    Spacer(), // Pushes dropdown to the right
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            details.globalPosition.dx, // X position
                            details.globalPosition.dy, // Y position
                            details.globalPosition.dx + 10, // Right padding
                            details.globalPosition.dy + 10, // Bottom padding
                          ),
                          items: [
                            PopupMenuItem(
                              value: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login2nd()));
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.logout, color: Colors.red),
                                    SizedBox(width: 8),
                                    Text("Logout"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      child: Icon(Icons.arrow_drop_down, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Search and Customer Section
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF7F1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTextField(Icons.search, "Search", 300),
                      _buildTextField(Icons.person, "Customer Name", 200),
                      _buildTextField(
                          Icons.currency_rupee_sharp, "Total Shipping", 160),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          height: 60,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0xFF96e6a1),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF96e6a1).withOpacity(0.3),
                                blurRadius: 8,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Register New Customer",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 20,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF7F1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          height: 60,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0xFF96e6a1),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF96e6a1).withOpacity(0.3),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Scan Items",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              // Main Content Layout with Table on Left and Discount on Right
              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(color: Colors.black12),
                ),
                child: Row(
                  children: [
                    // Left Side: Table List
                    LeftSection(),
                    SizedBox(width: 10),
                    // Right Side: Discount and Actions
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFabecd6), // #abecd6
                              Color(0xFFfbed96), // #fbed96
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black12, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Discount:",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(height: 12),
                            HoursSelectionWidget(),
                            SizedBox(height: 40),
                            // Action Buttons: Stack Order and Replacement
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildActionButton("Stack Order"),
                                _buildActionButton("Replacement")
                              ],
                            ),
                            SizedBox(height: 15),
                            // Action Buttons: General Expense and Advance
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildActionButton("General Expense"),
                                _buildActionButton("Advance"),
                              ],
                            ),
                            SizedBox(height: 15),
                            // Action Buttons: Take Salary and Other
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildActionButton("Take Salary"),
                                _buildActionButton("Other"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create text fields
  Widget _buildTextField(IconData icon, String label, double width) {
    return Container(
      child: Center(
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              labelText: label,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create action buttons with consistent styling
  // Widget _buildActionButton(String label) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
  //     decoration: BoxDecoration(
  //       color: Color(0xFF96e6a1),
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black26,
  //           blurRadius: 5,
  //           offset: Offset(0, 3),
  //         ),
  //       ],
  //     ),
  //     child: Center(
  //       child: Text(
  //         label,
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 14,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Helper method to create action buttons with improved styling
  Widget _buildActionButton(String label) {
    return Container(
      width: 144,
      height: 42,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFF96e6a1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
