import 'package:flutter/material.dart';

class SalesCard extends StatelessWidget {
  late String title;
  late String count;
  late String percentage;

  SalesCard(
      {super.key,
      required this.title,
      required this.count,
      required this.percentage});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white, // White background
          borderRadius: BorderRadius.circular(15), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Soft shadow for 3D effect
              blurRadius: 10,
              offset: Offset(4, 4), // Shadow on the bottom-right side
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05), // Light shadow for depth
              blurRadius: 10,
              offset:
                  Offset(-4, -4), // Shadow on the top-left for a lifted effect
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left Section - Icon and Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon with Circular Background
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color:
                          Colors.orangeAccent, // Background color for the icon
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(2, 2), // Inner shadow effect
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.category_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Total Sales Text
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),

                  // Sales Amount
                  Text(
                    count,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  // Growth Percentage
                  Text(
                    percentage,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Right Section - Image
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/green.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
