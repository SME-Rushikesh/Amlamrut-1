import 'package:flutter/material.dart';

class AddCustomerPage extends StatefulWidget {
  final Function(Map<String, String>) onCustomerAdded;

  AddCustomerPage({required this.onCustomerAdded});

  @override
  _AddCustomerPageState createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController gstController = TextEditingController();

  void _saveCustomer() {
    if (nameController.text.isNotEmpty && mobileController.text.isNotEmpty) {
      widget.onCustomerAdded({
        "name": nameController.text,
        "mobile": mobileController.text,
        "email": emailController.text,
        "address": addressController.text,
        "city": cityController.text,
        "pin": pinController.text,
        "state": stateController.text,
        "gst": gstController.text,
      });
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Name and Mobile No. are required!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade700),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light background for contrast
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Customer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF56AB2F),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: _buildTextField("Name", nameController)),
                            SizedBox(width: 10),
                            Expanded(
                                child: _buildTextField(
                                    "Mobile", mobileController,
                                    isNumber: true)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child:
                                    _buildTextField("Email", emailController)),
                            SizedBox(width: 10),
                            Expanded(
                                child: _buildTextField(
                                    "Address", addressController)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: _buildTextField("City", cityController)),
                            SizedBox(width: 10),
                            Expanded(
                                child: _buildTextField("Pin", pinController,
                                    isNumber: true)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child:
                                    _buildTextField("State", stateController)),
                            SizedBox(width: 10),
                            Expanded(
                                child: _buildTextField("GST", gstController)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: _saveCustomer,
              // icon: Icon(Icons.save, color: Colors.white),
              label: Text("Save Customer", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
            ),
          ),
        ],
      ),
    );
  }
}
