// import 'package:amlamrut/view/login.dart';
import 'package:amlamrut/view/home/home_screen.dart';
import 'package:amlamrut/view/login/login_2nd.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amlamrut',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Login(),
      home: Login2nd(),
      // home: HomeScreen(),
    );
  }
}
