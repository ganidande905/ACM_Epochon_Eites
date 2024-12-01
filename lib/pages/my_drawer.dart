
import 'package:flutter/material.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/profile_page.dart';
import 'package:app/pages/streaks_page.dart';
import 'package:app/pages/carbon_intake_page.dart';

class MyDrawer extends StatefulWidget {
 const MyDrawer({super.key, required this.onTap});
 final void Function() onTap;

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
   );
 }

 @override
 Widget build(BuildContext context) {
   return Drawer(
     backgroundColor: Colors.white,
     child: Column(
       children: [
         // Logo Section
         Container(
           padding: const EdgeInsets.only(top: 40),
           child: Column(
             children: [
               Image.asset(
                 'lib/assets/icons/logo.png',
                 height: 100,
                 width: 100,
                 fit: BoxFit.cover,
               ),
               const SizedBox(height: 10),
               const Text(
                 "GreenX",
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                   letterSpacing: 4.0,
                 ),
               ),
             ],
           ),
         ),
         const Divider(
           color: Colors.grey,
           thickness: 2,
           indent: 20,
           endIndent: 20,
         ),
         // Menu Items
         Expanded(
           child: ListView(
             children: [
               ListTile(
                 leading: const Icon(Icons.person, color: Colors.black),
                 title: const Text(
                   "Profile",
                   style: TextStyle(fontSize: 18),
                 ),
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const ProfilePage(),
                     ),
                   );
                 },
               ),
               ListTile(
                 leading: const Icon(Icons.bolt, color: Colors.black),
                 title: const Text(
                   "Your Streaks",
                   style: TextStyle(fontSize: 18),
                 ),
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const StreaksPage(),
                     ),
                   );
                 },
               ),
               ListTile(
                 leading: const Icon(Icons.calculate, color: Colors.black),
                 title: const Text(
                   "Calculate Carbon Intake",
                   style: TextStyle(fontSize: 18),
                 ),
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const CarbonIntakePage(),
                     ),
                   );
                 },
               ),
             ],
           ),
         ),
         // Logout Button
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 20),
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
                 color: Colors.black,
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



