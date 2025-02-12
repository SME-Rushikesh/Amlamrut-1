import 'package:flutter/material.dart';

class ProductSelection extends StatefulWidget {
  @override
  _ProductSelectionState createState() => _ProductSelectionState();
}

class _ProductSelectionState extends State<ProductSelection> {
  final List<Map<String, dynamic>> products = [
    {'name': 'Product A', 'price': 50.0},
    {'name': 'Product B', 'price': 100.0},
    {'name': 'Product C', 'price': 150.0},
  ];

  List<Map<String, dynamic>> selectedProducts = [];

  void addProductSection() {
    setState(() {
      selectedProducts.add({
        'selectedProduct': null,
        'quantity': '',
        'price': 0.0,
        'discount': '',
        'finalPrice': 0.0,
      });
    });
  }

  void removeProductSection(int index) {
    setState(() {
      selectedProducts.removeAt(index);
    });
  }

  void resetFields() {
    setState(() {
      selectedProducts.clear();
    });
  }

  void updateFinalPrice(int index) {
    setState(() {
      double price = selectedProducts[index]['price'];
      int quantity = int.tryParse(selectedProducts[index]['quantity']) ?? 1;
      double discount =
          double.tryParse(selectedProducts[index]['discount']) ?? 0.0;

      double totalPrice = price * quantity;
      double discountedPrice = totalPrice - (totalPrice * (discount / 100));

      selectedProducts[index]['finalPrice'] = discountedPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(selectedProducts.length, (index) {
                    return buildProductSection(index);
                  }),
                ),
              ),
            ),

            SizedBox(height: 15),

            // Reset & Add Product Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Reset Button
                ElevatedButton.icon(
                  onPressed: resetFields,
                  icon: Icon(Icons.refresh),
                  label: Text("Reset"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),

                // Add Product Button
                ElevatedButton.icon(
                  onPressed: addProductSection,
                  icon: Icon(Icons.add),
                  label: Text("Add Product"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductSection(int index) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Row(
          children: [
            // Product Dropdown
            Expanded(
              flex: 2,
              child: DropdownButtonFormField<String>(
                decoration: inputDecoration("Product"),
                value: selectedProducts[index]['selectedProduct'],
                onChanged: (newValue) {
                  setState(() {
                    selectedProducts[index]['selectedProduct'] = newValue;
                    double newPrice = products
                        .firstWhere((p) => p['name'] == newValue)['price'];
                    selectedProducts[index]['price'] = newPrice;
                    updateFinalPrice(index);
                  });
                },
                items: products.map((product) {
                  return DropdownMenuItem<String>(
                    value: product['name'],
                    child:
                        Text(product['name'], style: TextStyle(fontSize: 12)),
                  );
                }).toList(),
              ),
            ),

            SizedBox(width: 5),

            // Quantity Field
            Expanded(
              flex: 1,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: inputDecoration("Qty"),
                onChanged: (value) {
                  selectedProducts[index]['quantity'] = value;
                  updateFinalPrice(index);
                },
              ),
            ),

            SizedBox(width: 5),

            // Price Field (Read-Only)
            Expanded(
              flex: 1,
              child: TextField(
                readOnly: true,
                decoration: inputDecoration("Price"),
                controller: TextEditingController(
                  text: selectedProducts[index]['price'].toStringAsFixed(2),
                ),
              ),
            ),

            SizedBox(width: 5),

            // Discount Field
            Expanded(
              flex: 1,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: inputDecoration("Discount"),
                onChanged: (value) {
                  selectedProducts[index]['discount'] = value;
                  updateFinalPrice(index);
                },
              ),
            ),

            SizedBox(width: 5),

            // Final Price Field (Read-Only)
            Expanded(
              flex: 1,
              child: TextField(
                readOnly: true,
                decoration: inputDecoration("Final"),
                controller: TextEditingController(
                  text:
                      selectedProducts[index]['finalPrice'].toStringAsFixed(2),
                ),
              ),
            ),

            SizedBox(width: 5),

            // Remove Button
            IconButton(
              icon: Icon(Icons.remove_circle, color: Colors.red, size: 20),
              onPressed: () => removeProductSection(index),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(fontSize: 12),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    );
  }
}
