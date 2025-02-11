import 'dart:convert';

import 'package:flutter/material.dart';

class DataTableSection extends StatefulWidget {
  @override
  State<DataTableSection> createState() => _DataTableSectionState();
}

class _DataTableSectionState extends State<DataTableSection> {
  // Static JSON data (simulating an API response)
  final String jsonResponse = '''
  {
    "data": [
      {
        "SR_No": 1,
        "ERN_No": "ERN12345",
        "Product_Name": "Product A",
        "Qty": 2,
        "Unit_Price": 25.00,
        "Discount": 5.00,
        "Total": 45.00
      },
      {
        "SR_No": 2,
        "ERN_No": "ERN12346",
        "Product_Name": "Product B",
        "Qty": 1,
        "Unit_Price": 40.00,
        "Discount": 4.00,
        "Total": 36.00
      },
      {
        "SR_No": 3,
        "ERN_No": "ERN12347",
        "Product_Name": "Product C",
        "Qty": 3,
        "Unit_Price": 15.00,
        "Discount": 3.00,
        "Total": 42.00
      },
      {
        "SR_No": 4,
        "ERN_No": "ERN12348",
        "Product_Name": "Product D",
        "Qty": 5,
        "Unit_Price": 12.00,
        "Discount": 2.00,
        "Total": 50.00
      },
      {
        "SR_No": 5,
        "ERN_No": "ERN12349",
        "Product_Name": "Product E",
        "Qty": 4,
        "Unit_Price": 18.00,
        "Discount": 1.50,
        "Total": 62.00
      },
      {
        "SR_No": 5,
        "ERN_No": "ERN12349",
        "Product_Name": "Product E",
        "Qty": 4,
        "Unit_Price": 18.00,
        "Discount": 1.50,
        "Total": 62.00
      },
      {
        "SR_No": 5,
        "ERN_No": "ERN12349",
        "Product_Name": "Product E",
        "Qty": 4,
        "Unit_Price": 18.00,
        "Discount": 1.50,
        "Total": 62.00
      },
      {
        "SR_No": 5,
        "ERN_No": "ERN12349",
        "Product_Name": "Product E",
        "Qty": 4,
        "Unit_Price": 18.00,
        "Discount": 1.50,
        "Total": 62.00
      },
      {
        "SR_No": 5,
        "ERN_No": "ERN12349",
        "Product_Name": "Product E",
        "Qty": 4,
        "Unit_Price": 18.00,
        "Discount": 1.50,
        "Total": 62.00
      },
      {
        "SR_No": 5,
        "ERN_No": "ERN12349",
        "Product_Name": "Product E",
        "Qty": 4,
        "Unit_Price": 18.00,
        "Discount": 1.50,
        "Total": 62.00
      }
    ]
  }
  ''';

  List<Map<String, dynamic>> tableData = [];
  @override
  void initState() {
    super.initState();
    // Parse the static JSON data
    Map<String, dynamic> parsedData = jsonDecode(jsonResponse);
    tableData = List<Map<String, dynamic>>.from(parsedData['data']);
  }

  // Method to remove an item from the tableData list
  void removeItem(int index) {
    setState(() {
      tableData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // // Maping the data to the static json data
    // Map<String, dynamic> data = jsonDecode(jsonResponse);
    // List<Map<String, dynamic>> dataTable =
    //     List<Map<String, dynamic>>.from(data['data']);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 1000,
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.blue),
          // ),
          child: DataTable(
            columnSpacing: 20, // Space between columns
            horizontalMargin: 20,
            headingRowHeight: 56, // Height of the header row
            dataRowHeight: 56, // Height of the data rows
            columns: [
              DataColumn(
                label: Text('SR No',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('ERN No',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Product Name',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label:
                    Text('Qty', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Unit Price',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Discount',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Total',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                label: Text('Actions',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
            rows: tableData.map((row) {
              int index = tableData.indexOf(row);
              return DataRow(
                cells: [
                  DataCell(Text(row['SR_No'].toString())),
                  DataCell(Text(row['ERN_No'])),
                  DataCell(Text(row['Product_Name'])),
                  DataCell(Text(row['Qty'].toString())),
                  DataCell(Text(row['Unit_Price'].toString())),
                  DataCell(Text(row['Discount'].toString())),
                  DataCell(Text(row['Total'].toString())),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.highlight_remove_outlined,
                          color: Colors.red),
                      onPressed: () => removeItem(index),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
