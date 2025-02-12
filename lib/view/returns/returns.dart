import 'package:amlamrut/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class ReturnsPage extends StatefulWidget {
  @override
  State<ReturnsPage> createState() => _ReturnsPageState();
}

class _ReturnsPageState extends State<ReturnsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomAppBar(title: "Returns", username: "User")
          .buildSidebar(context),
      appBar: CustomAppBar(title: "Returns"),
      body: SafeArea(
        child: Center(
          child: Text("Coming Soon.."),
        ),
      ),
    );
  }
}
