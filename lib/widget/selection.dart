import 'package:flutter/material.dart';

class HoursSelectionWidget extends StatefulWidget {
  const HoursSelectionWidget({super.key});

  @override
  State<HoursSelectionWidget> createState() => _HoursSelectionWidgetState();
}

class _HoursSelectionWidgetState extends State<HoursSelectionWidget> {
  // Track the selected box
  int? selectedBoxIndex;

  // Function to handle selection
  void _onBoxTap(int index) {
    setState(() {
      // Toggle selection
      if (selectedBoxIndex == index) {
        selectedBoxIndex = null; // Unselect if clicked again
      } else {
        selectedBoxIndex = index; // Select the clicked box
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Horizontal Scrollable Box Selection
        Row(
          children: List.generate(3, (index) {
            // The discount values 10, 20, 25
            int discountAmount = [10, 20, 25][index];

            return GestureDetector(
              onTap: () => _onBoxTap(index),
              child: Container(
                width: 50, // Adjust width for better visibility
                height: 50, // Adjust height for better visibility
                margin: const EdgeInsets.only(right: 10), // Space between boxes
                decoration: BoxDecoration(
                  color: selectedBoxIndex == index
                      ? Colors.green
                      : Color(0xFFEFF7F1),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$discountAmount%', // Display discount amounts 10, 20, 25
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedBoxIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
