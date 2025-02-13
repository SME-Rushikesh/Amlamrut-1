import 'package:amlamrut/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'add_customer.dart'; // Import the new page

class CustomerPage extends StatefulWidget {
  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  List<Map<String, String>> customers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading effect
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void _navigateToAddCustomer() async {
    await Navigator.push(
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
  }

  Widget _buildCustomerList() {
    if (isLoading) {
      return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      );
    } else if (customers.isEmpty) {
      return Center(child: Text("No customers added yet"));
    } else {
      return ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(customers[index]['name']!),
            subtitle: Text(customers[index]['mobile']!),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  customers.removeAt(index);
                });
              },
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomAppBar(title: "Customers", username: "User")
      //     .buildSidebar(context),
      // appBar: CustomAppBar(title: "Customers", username: "User"),
      body: _buildCustomerList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddCustomer,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
