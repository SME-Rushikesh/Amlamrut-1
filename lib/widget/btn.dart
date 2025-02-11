import 'package:flutter/material.dart';

class RoundBtn extends StatefulWidget {
  late String Title;
  final void Function()? onTap;

  RoundBtn({super.key, required this.Title, required this.onTap});

  @override
  State<RoundBtn> createState() => _RoundBtn();
}

class _RoundBtn extends State<RoundBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // Make the background transparent
        elevation: 8, // Add elevation to give a raised effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11), // Rounded corners
        ),
        padding: EdgeInsets.zero, // Remove padding for full button width
        shadowColor: Color(0xFF96e6a1), // Shadow color for the button
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFd4fc79), // #d4fc79
              Color(0xFF96e6a1), // #96e6a1
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Container(
          width: double.infinity,
          height: 45,
          alignment: Alignment.center,
          child: Text(
            widget.Title,
            style: TextStyle(
              fontSize: 16, // Slightly larger font for better visibility
              fontWeight: FontWeight.w600, // Bold text for prominence
              color: Colors.black, // Text color for visibility
            ),
          ),
        ),
      ),
    );
  }
}
