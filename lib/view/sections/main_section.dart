import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:animated_custom_dropdown/animated_custom_dropdown.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class ProductOrderPage extends StatefulWidget {
  @override
  _ProductOrderPageState createState() => _ProductOrderPageState();
}

class _ProductOrderPageState extends State<ProductOrderPage> {
  double? selectedDiscount;
  final List<Map<String, dynamic>> products = [
    {'name': 'Product A', 'price': 50.0},
    {
      'name': 'Product B',
      'price': 100.0,
    },
    {
      'name': 'Product C',
      'price': 150.0,
    },
  ];

  List<Map<String, dynamic>> selectedProducts = [];
  String? selectedPaymentMethod;

  void addProductSection() {
    setState(() {
      selectedProducts.add({
        'selectedProduct': null,
        'quantity': 1,
        'price': 0.0,
        'discount': 0.0,
        'finalPrice': 0.0,
      });
    });
  }

  void removeProductSection(int index) {
    setState(() {
      selectedProducts.removeAt(index);
    });
  }

  void updateFinalPrice(int index) {
    setState(() {
      double price = selectedProducts[index]['price'];
      int quantity = selectedProducts[index]['quantity'];

      double totalPrice = price * quantity;
      double discountedPrice = totalPrice;

      selectedProducts[index]['finalPrice'] = discountedPrice;
    });
  }

  double getTotalAmount() {
    return selectedProducts.fold(0.0, (sum, product) {
      return sum + product['finalPrice'];
    });
  }

  void resetOrder() {
    setState(() {
      selectedProducts.clear();
      selectedPaymentMethod = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 480,
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text("Product",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      Expanded(
                          flex: 1,
                          child: Text("Quantity",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      Expanded(
                          flex: 1,
                          child: Text("Price",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      Expanded(
                          flex: 1,
                          child: Text("Final Price",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(width: 30),
                    ],
                  ),
                ),
                // Dynamic Product Cards
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(selectedProducts.length, (index) {
                        return buildProductSection(index);
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Total Amount
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Submit and payment Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              onPressed: resetOrder,
                              icon: Icon(Icons.refresh,
                                  size: 14), // Reduced icon size
                              label: Text('Reset',
                                  style: TextStyle(
                                      fontSize: 12)), // Reduced font size
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8), // Reduced padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            ElevatedButton.icon(
                              onPressed: addProductSection,
                              icon: Icon(Icons.add,
                                  size: 14), // Reduced icon size
                              label: Text("Add Product",
                                  style: TextStyle(
                                      fontSize: 12)), // Reduced font size
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8), // Reduced padding
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Payment Method Selection
                            Row(
                              children:
                                  ['Cash', 'Card', 'Online'].map((method) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4), // Spacing between buttons
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedPaymentMethod =
                                            method; // Update the selected payment method
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: selectedPaymentMethod ==
                                              method
                                          ? Colors.blue // Active button color
                                          : Colors.grey[
                                              300], // Inactive button color
                                      foregroundColor: selectedPaymentMethod ==
                                              method
                                          ? Colors.white // Active text color
                                          : Colors.black, // Inactive text color
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8), // Button padding
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // Rounded corners
                                      ),
                                    ),
                                    child: Text(
                                      method,
                                      style: TextStyle(
                                          fontSize: 12), // Button text size
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Total: \₹${getTotalAmount().toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 14, // Reduced font size
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            // Submit Button
                            ElevatedButton(
                              onPressed: () {
                                // Handle submit action
                              },
                              child: Text('Submit',
                                  style: TextStyle(
                                      fontSize: 12)), // Reduced font size
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8), // Reduced padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 480,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Discount Section
                Text(
                  'Discount',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [10.0, 15.0, 20.0, 25.0].map((discount) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4), // Spacing between containers
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDiscount =
                                discount; // Update the selected discount
                          });
                        },
                        child: Container(
                          width: 40, // Size of the circular container
                          height: 40, // Size of the circular container
                          decoration: BoxDecoration(
                            color: selectedDiscount == discount
                                ? Colors.blue // Active container color
                                : Colors.grey[200], // Inactive container color
                            shape: BoxShape.circle, // Circular shape
                          ),
                          child: Center(
                            child: Text(
                              '${discount.toInt()}%', // Display discount percentage
                              style: TextStyle(
                                fontSize: 12,
                                color: selectedDiscount == discount
                                    ? Colors.white // Active text color
                                    : Colors.black, // Inactive text color
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),

                // Buttons for Stack Order, Replacement, and Expenses
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     // Stack Order Button
                //     ElevatedButton(
                //       onPressed: () {
                //         // Handle Stack Order logic
                //       },
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.green,
                //         foregroundColor: Colors.white,
                //         padding:
                //             EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //         shape: RoundedRectangleBorder(
                //           borderRadius:
                //               BorderRadius.circular(20), // Rounded corners
                //         ),
                //       ),
                //       child: Text(
                //         'Stack Order',
                //         style: TextStyle(fontSize: 12),
                //       ),
                //     ),

                //     // Replacement Button
                //     ElevatedButton(
                //       onPressed: () {
                //         // Handle Replacement logic
                //       },
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.green,
                //         foregroundColor: Colors.white,
                //         padding:
                //             EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //         shape: RoundedRectangleBorder(
                //           borderRadius:
                //               BorderRadius.circular(20), // Rounded corners
                //         ),
                //       ),
                //       child: Text(
                //         'Replacement',
                //         style: TextStyle(fontSize: 12),
                //       ),
                //     ),

                //     // Expenses Button
                //     ElevatedButton(
                //       onPressed: () {
                //         // Handle Expenses logic
                //       },
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.green,
                //         foregroundColor: Colors.white,
                //         padding:
                //             EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //         shape: RoundedRectangleBorder(
                //           borderRadius:
                //               BorderRadius.circular(20), // Rounded corners
                //         ),
                //       ),
                //       child: Text(
                //         'Expenses',
                //         style: TextStyle(fontSize: 12),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProductSection(int index) {
    return Container(
      height: 40,
      // margin: EdgeInsets.symmetric(vertical: 0), // Reduced margin
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30, // Fixed width for serial number
            child: Text(
              '${index + 1}.',
              style: TextStyle(fontSize: 12), // Reduced font size
            ),
          ),
          SizedBox(width: 5),
          // Product Dropdown
          Expanded(
            flex: 2,
            child: Container(
              height: 30,
              child: CustomDropdown<String>(
                hintText: "Select Product",
                closedHeaderPadding: EdgeInsets.only(top: 5, left: 5, right: 5),
                items: products
                    .map((product) => product['name'] as String)
                    .toList(),
                decoration: CustomDropdownDecoration(
                  // closedBorder: Border.all(color: Colors.grey.shade200),
                  closedBorderRadius: BorderRadius.circular(8),
                  headerStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  listItemStyle: TextStyle(fontSize: 12, color: Colors.black),
                ),
                onChanged: (newValue) {
                  setState(() {
                    selectedProducts[index]['selectedProduct'] = newValue;
                    double newPrice = products
                        .firstWhere((p) => p['name'] == newValue)['price'];
                    selectedProducts[index]['price'] = newPrice;
                    updateFinalPrice(index);
                  });
                },
              ),
            ),
          ),
          SizedBox(width: 5),
          // Quantity Field
          Expanded(
            flex: 1,
            child: Container(
              height: 30,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: inputDecoration(),
                style: TextStyle(fontSize: 12), // Reduced font size
                onChanged: (value) {
                  selectedProducts[index]['quantity'] =
                      int.tryParse(value) ?? 1;
                  updateFinalPrice(index);
                },
              ),
            ),
          ),
          SizedBox(width: 5),

          // Price Field (Read-Only)
          Expanded(
            flex: 1,
            child: Container(
              height: 30,
              child: TextField(
                readOnly: true,
                decoration: inputDecoration(),
                style: TextStyle(fontSize: 12), // Reduced font size
                controller: TextEditingController(
                  text: selectedProducts[index]['price'].toStringAsFixed(2),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),

          // Discount Field
          Expanded(
            flex: 1,
            child: Container(
              height: 30,
              child: TextField(
                readOnly: true,
                decoration: inputDecoration(),
                style: TextStyle(fontSize: 12), // Reduced font size
                controller: TextEditingController(
                  text: selectedProducts[index]['discount'].toStringAsFixed(2),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),

          // Final Price Field (Read-Only)
          Expanded(
            flex: 1,
            child: Container(
              height: 30,
              child: TextField(
                readOnly: true,
                decoration: inputDecoration(),
                style: TextStyle(fontSize: 12), // Reduced font size
                controller: TextEditingController(
                  text:
                      selectedProducts[index]['finalPrice'].toStringAsFixed(2),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),

          // Remove Button
          IconButton(
            icon: Icon(Icons.remove_circle,
                color: Colors.red, size: 20), // Reduced icon size
            onPressed: () => removeProductSection(index),
          ),
        ],
      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      labelStyle: TextStyle(fontSize: 12), // Reduced font size
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      contentPadding:
          EdgeInsets.symmetric(horizontal: 6, vertical: 4), // Reduced padding
    );
  }
}
