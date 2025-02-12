import 'package:amlamrut/view/new_sales/leftsection.dart';
import 'package:amlamrut/view/new_sales/rightsection.dart';
import 'package:amlamrut/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class NewSalesPage extends StatefulWidget {
  @override
  State<NewSalesPage> createState() => _NewSalesPageState();
}

class _NewSalesPageState extends State<NewSalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomAppBar(title: "New Sales", username: "User")
          .buildSidebar(context),
      appBar: CustomAppBar(title: "New Sales"),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductSelection(),
          CustomerSelection(),
        ],
      ),
    );
  }
}
