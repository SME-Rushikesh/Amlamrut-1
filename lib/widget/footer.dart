import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async'; // Import the timer package

class FooterWidget extends StatefulWidget {
  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  late String formattedDateTime;
  late Timer _timer; // Declare a Timer to refresh the time

  @override
  void initState() {
    super.initState();
    // Initialize the time when the widget is created
    formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    // Set up a timer to update the time every second
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // Update the time every second
        formattedDateTime =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: EdgeInsets.all(16), // Add padding for spacing
      decoration: BoxDecoration(
        color: Color(0xFFEFF7F1), // Light background color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Date and Time
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              formattedDateTime, // Display the formatted date-time
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87, // Subtle text color
              ),
            ),
          ),

          // Right side: Financial Stats (Total Sale, Invoice, etc.)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFooterItem("Total Sale"),
                _buildFooterItem("Total Invoice"),
                _buildFooterItem("Total Cash"),
                _buildFooterItem("Total Card"),
                _buildFooterItem("Total Online"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create each footer item container with consistent styling
  Widget _buildFooterItem(String label) {
    return Container(
      width: 144,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFF96e6a1), // Soft green background for items
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF96e6a1).withOpacity(0.3), // Soft shadow for depth
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black, // White text for contrast
          ),
        ),
      ),
    );
  }
}
