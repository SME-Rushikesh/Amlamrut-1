import 'package:amlamrut/view/customer/add_customer.dart';
import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

typedef Customer = Map<String, String>;

class CustomerSearchDropdown extends StatefulWidget {
  @override
  _CustomerSearchDropdownState createState() => _CustomerSearchDropdownState();
}

class _CustomerSearchDropdownState extends State<CustomerSearchDropdown> {
  final List<Customer> customers = [
    {'name': 'Amit Sharma', 'mobno': '7894561235', 'amount': '₹5000'},
    {'name': 'Priya Patel', 'mobno': '8945761258', 'amount': '₹3000'},
    {'name': 'Vikas Reddy', 'mobno': '9876541253', 'amount': '₹7000'},
  ];

  Customer? selectedCustomer;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 4,
        //     offset: Offset(0, 2),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CustomDropdown<String>.search(
              hintText: "Select Customer",
              // overlayHeight: 50,
              closedHeaderPadding: EdgeInsets.all(6),
              excludeSelected: false,
              items: customers.map((customer) {
                return '${customer['name']} - ${customer['mobno']}';
              }).toList(),
              onChanged: (name) {
                setState(() {
                  selectedCustomer = customers.firstWhere(
                    (customer) =>
                        '${customer['name']} - ${customer['mobno']}' == name,
                  );
                });
              },
              decoration: CustomDropdownDecoration(
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
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    selectedCustomer != null
                        ? selectedCustomer!['amount']!
                        : "₹0",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          TextButton(
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
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Add Customer",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
