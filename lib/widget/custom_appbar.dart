import 'dart:ui';
import 'package:amlamrut/view/customer/customer.dart';
import 'package:amlamrut/view/home/home_screen.dart';
import 'package:amlamrut/view/new_sales/new_sales_page.dart';
import 'package:amlamrut/view/record_screen/sales_record.dart';
import 'package:amlamrut/view/returns/returns.dart';
import 'package:flutter/material.dart';
import 'package:amlamrut/view/login/login_2nd.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String username;

  const CustomAppBar({super.key, required this.title, this.username = "User"});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF56AB2F), Color(0xFFA8E063)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Sidebar Menu Icon
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black, size: 28),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Open Sidebar
                  },
                ),

                const SizedBox(width: 10),

                // Title
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 10),

                // Logo
                ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Sidebar Drawer Widget
  Widget buildSidebar(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF56AB2F), Color(0xFFA8E063)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: Text(
              username,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text("user@example.com"),
            currentAccountPicture: const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text("New Sales"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewSalesPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text("Sales Record"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SalesRecord()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.autorenew),
            title: const Text("Returns"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReturnsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            title: const Text("Customers"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomerPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login2nd()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Icon(icon, color: Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
