import 'package:flutter/material.dart';

class ProductSelection extends StatefulWidget {
  @override
  _ProductSelectionState createState() => _ProductSelectionState();
}

class _ProductSelectionState extends State<ProductSelection> {
  // Dummy product list with prices
  final List<Map<String, dynamic>> products = [
    {'name': 'Product A', 'price': 50.0},
    {'name': 'Product B', 'price': 100.0},
    {'name': 'Product C', 'price': 150.0},
  ];

  // List to store selected products
  List<Map<String, dynamic>> selectedProducts = [];

  // Function to add a new product section
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

  // Function to remove a product section
  void removeProductSection(int index) {
    setState(() {
      selectedProducts.removeAt(index);
    });
  }

  // Function to update final price based on quantity and discount
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
          crossAxisAlignment: CrossAxisAlignment.end,
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

            // Add More Product Button
            ElevatedButton.icon(
              onPressed: addProductSection,
              icon: Icon(Icons.add),
              label: Text("Add Product"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build each product section
  Widget buildProductSection(int index) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          children: [
            // Product Dropdown
            Expanded(
              flex: 2,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Select Product",
                  border: OutlineInputBorder(),
                ),
                value: selectedProducts[index]['selectedProduct'],
                onChanged: (newValue) {
                  setState(() {
                    selectedProducts[index]['selectedProduct'] = newValue;
                    double newPrice = products
                        .firstWhere((p) => p['name'] == newValue)['price'];
                    selectedProducts[index]['price'] = newPrice;
                    updateFinalPrice(index); // Update final price
                  });
                },
                items: products.map((product) {
                  return DropdownMenuItem<String>(
                    value: product['name'],
                    child: Text(product['name']),
                  );
                }).toList(),
              ),
            ),
            SizedBox(width: 10),

            // Quantity Field
            Expanded(
              flex: 1,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Qty",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  selectedProducts[index]['quantity'] = value;
                  updateFinalPrice(index);
                },
              ),
            ),
            SizedBox(width: 10),

            // Auto-filled Price
            Expanded(
              flex: 1,
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(
                  text: selectedProducts[index]['price'].toStringAsFixed(2),
                ),
              ),
            ),
            SizedBox(width: 10),

            // Discount Field
            Expanded(
              flex: 1,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Discount (%)",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  selectedProducts[index]['discount'] = value;
                  updateFinalPrice(index);
                },
              ),
            ),
            SizedBox(width: 10),

            // Final Price after Discount
            Expanded(
              flex: 1,
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Final Price",
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(
                  text:
                      selectedProducts[index]['finalPrice'].toStringAsFixed(2),
                ),
              ),
            ),
            SizedBox(width: 10),

            // Remove Button
            IconButton(
              icon: Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () => removeProductSection(index),
            ),
          ],
        ),
      ),
    );
  }
}
