// import 'package:amlamrut/view/home/home_screen.dart';
import 'package:amlamrut/view/home/home_screen.dart';
import 'package:amlamrut/widget/btn.dart';
import 'package:flutter/material.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  // This variable controls whether the password is visible or hidden
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          // border: Border.all(color: Colors.black)
        ),
        child: Center(
          child: Container(
            width: 250,
            height: 300,
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFd4fc79).withOpacity(0.3), // #d4fc79
                        Color(0xFF96e6a1).withOpacity(0.3), // #96e6a1
                      ],
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder
                          .none, // Removed the default border to use the gradient container border
                      enabledBorder:
                          InputBorder.none, // Same here, no default border
                      focusedBorder:
                          InputBorder.none, // Same here, no default border
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFd4fc79).withOpacity(0.3), // #d4fc79
                        Color(0xFF96e6a1).withOpacity(0.3), // #96e6a1
                      ],
                    ),
                  ),
                  child: TextFormField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ), // Change the icon based on the state
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible =
                                !_isPasswordVisible; // Toggle the visibility
                          });
                        },
                      ),
                      border: InputBorder
                          .none, // Remove the default border to use the gradient container border
                      enabledBorder:
                          InputBorder.none, // Same here, no default border
                      focusedBorder:
                          InputBorder.none, // Same here, no default border
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RoundBtn(
                  Title: "Login",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
