import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:amlamrut/view/customer/add_customer.dart';
import 'dart:developer';

class CustomerSelection extends StatefulWidget {
  @override
  _CustomerSelectionState createState() => _CustomerSelectionState();
}

class _CustomerSelectionState extends State<CustomerSelection> {
  // Customer List
  final List<Map<String, String>> customers = [
    {
      'name': 'Amit Sharma',
      'mobile': '9876543210',
      'email': 'amit.sharma@example.com',
      'address': '12, MG Road',
      'city': 'Mumbai',
      'pin': '400001',
      'state': 'Maharashtra',
      'gst': 'GSTMH123456'
    },
    {
      'name': 'Priya Patel',
      'mobile': '9765432109',
      'email': 'priya.patel@example.com',
      'address': '45, Nehru Nagar',
      'city': 'Ahmedabad',
      'pin': '380001',
      'state': 'Gujarat',
      'gst': 'GSTGJ654321'
    },
    {
      'name': 'Vikas Reddy',
      'mobile': '9865123478',
      'email': 'vikas.reddy@example.com',
      'address': '56, Jubilee Hills',
      'city': 'Hyderabad',
      'pin': '500033',
      'state': 'Telangana',
      'gst': 'GSTTS901234'
    }
  ];

  // Selected customer
  Map<String, String>? selectedCustomer;
  bool showCustomerDetails = false;

  // Pricing Details
  double totalAmount = 500.0;
  double discount = 10.0;
  double finalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    calculateFinalPrice();
  }

  void calculateFinalPrice() {
    setState(() {
      double discountAmount = (totalAmount * discount) / 100;
      finalPrice = totalAmount - discountAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: Column(
        children: [
          // Customer Selection Container
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: Offset(5, 5),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(-5, -5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Animated Dropdown
                CustomDropdown<String>.search(
                  hintText: "Select Customer",
                  items:
                      customers.map((customer) => customer['name']!).toList(),
                  excludeSelected: false,
                  onChanged: (name) {
                    log('Selected Customer: $name');
                    setState(() {
                      selectedCustomer = customers
                          .firstWhere((customer) => customer['name'] == name);
                      showCustomerDetails = true;
                    });
                  },
                ),
                SizedBox(height: 10),
                // Expandable Customer Details
                AnimatedSize(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: showCustomerDetails && selectedCustomer != null
                      ? Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildDetailRow(
                                  "Name", selectedCustomer!['name']!),
                              buildDetailRow(
                                  "Mobile", selectedCustomer!['mobile']!),
                              buildDetailRow(
                                  "Email", selectedCustomer!['email']!),
                              buildDetailRow(
                                "Address",
                                "${selectedCustomer!['address']}, ${selectedCustomer!['city']}, ${selectedCustomer!['pin']}, ${selectedCustomer!['state']}",
                              ),
                              buildDetailRow("GST", selectedCustomer!['gst']!),
                            ],
                          ),
                        )
                      : Container(),
                ),
                SizedBox(height: 10),
                // Add Customer Button
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCustomerPage(
                            onCustomerAdded: (customer) {
                              setState(() {
                                customers.add(customer);
                              });
                            },
                          ),
                        ),
                      );
                    },
                    label: Text("Add Customer",
                        style: TextStyle(color: Colors.green)),
                    icon: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          // Pricing Details Container
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: Offset(5, 5),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(-5, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      buildPriceRow(
                          "Total Amount", "₹${totalAmount.toStringAsFixed(2)}"),
                      buildPriceRow("Discount", "$discount%"),
                      buildPriceRow(
                          "Final Price", "₹${finalPrice.toStringAsFixed(2)}",
                          isBold: true),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle order submission
                    },
                    child: Text("Submit Order"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for customer details
  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            "$label:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for price details
  Widget buildPriceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
