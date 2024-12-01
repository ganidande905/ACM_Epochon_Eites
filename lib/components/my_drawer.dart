import 'package:app/pages/login_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  void logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Successfully logged out')),
      // duratio n: const Duration(seconds: 2),
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: MediaQuery.of(context).size.width / 2 - 80, // Center the logo
            child: Image.asset(
              'lib/assets/icons/logo.png',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          // Divider
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 270,
            left: MediaQuery.of(context).size.width / 2 - 100,
            child: const Text(
              "GreenX",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 4.0,
              ),
            ),
          ),
          const Positioned(
            top: 180,
            left: 25,
            right: 25,
            child: Divider(
              color: Colors.grey,
              thickness: 2,
            ),
          ),

          Positioned(
            bottom: 30, // Distance from the bottom
            left: MediaQuery.of(context).size.width / 2 -
                160, // Center the button
            child: ElevatedButton(
              onPressed: logout,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(165, 255, 253, 253),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              ),
              child: const Text(
                "LOGOUT",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
