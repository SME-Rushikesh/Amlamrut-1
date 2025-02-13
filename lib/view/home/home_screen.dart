import 'dart:ui';
// import 'package:amlamrut/view/new_sales/leftsection.dart';
import 'package:amlamrut/view/new_sales/leftsection.dart';
import 'package:amlamrut/view/sections/main_section.dart';
import 'package:amlamrut/view/sections/search_section.dart';
import 'package:amlamrut/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC8F5E6), // Light pastel green background

      appBar: CustomAppBar(
        title: "Dashboard",
        storeName: "Amlamrut",
        storeId: "AM001",
        username: "User",
      ),

      body: SafeArea(
        child: Column(
          children: [
            //search bar section
            CustomerSearchDropdown(),
            // SizedBox(height: 5),

            //Main section
            ProductOrderPage(),

            // Row(
            //   children: [
            //     Expanded(
            //         flex: 3,
            //         child: Container(
            //           height: 450,
            //           color: Colors.white,
            //           child: Text("left"),
            //         )),
            //     // ProductSelection(),
            //     Expanded(
            //         flex: 1,
            //         child: Container(
            //           height: 450,
            //           color: Colors.yellow,
            //           child: Text("Right"),
            //         )),
            //   ],
            // ),
            //left section

            //right section

            //bottom section
          ],
        ),
      ),
    );
  }
}
