import 'package:amlamrut/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class SalesRecord extends StatefulWidget {
  @override
  State<SalesRecord> createState() => _SalesRecordState();
}

class _SalesRecordState extends State<SalesRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomAppBar(title: "Sales Records", username: "User")
          .buildSidebar(context),
      appBar: CustomAppBar(title: "Sales Records"),
      body: SafeArea(
        child: Center(
          child: Text("Coming Soon.."),
        ),
      ),
    );
  }
}
