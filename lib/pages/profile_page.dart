
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
 const ProfilePage({super.key});

 @override
 _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 String username = "Guest";
 
 int streakCount = 0;
 double fitnessPoints = 0.0;

 @override
 void initState() {
   super.initState();
   _loadProfileData();
 }

 // Load profile data (username, streak count, fitness points) from SharedPreferences
 Future<void> _loadProfileData() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String? storedUsername = prefs.getString('username') ?? "Guest";
   int storedStreakCount = prefs.getInt('streakCount') ?? 0;
   double storedFitnessPoints = prefs.getDouble('fitnessPoints') ?? 0.0;

   setState(() {
     username = storedUsername;
     streakCount = storedStreakCount;
     fitnessPoints = storedFitnessPoints;
   });
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("Profile"),
     ),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           // Profile Header
           Text(
             "Welcome, $username",
             style: const TextStyle(
               fontSize: 28,
               fontWeight: FontWeight.bold,
             ),
           ),
           const SizedBox(height: 20),

           // Display Streak Count
           Text(
             "Current Streak: $streakCount day(s)",
             style: const TextStyle(
               fontSize: 20,
             ),
           ),
           const SizedBox(height: 20),

           // Display Latest Fitness Points
           Text(
             "Latest Fitness Points: ${fitnessPoints.toStringAsFixed(2)}",
             style: const TextStyle(
               fontSize: 20,
             ),
           ),
           const SizedBox(height: 30),

           // Edit Profile Button (to change username)
           ElevatedButton(
             onPressed: () async {
               String? newUsername = await _showUsernameDialog();
               if (newUsername != null && newUsername.isNotEmpty) {
                 SharedPreferences prefs = await SharedPreferences.getInstance();
                 await prefs.setString('username', newUsername);
                 setState(() {
                   username = newUsername;
                 });
               }
             },
             style: ElevatedButton.styleFrom(
               padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
               backgroundColor: const Color.fromARGB(165, 255, 253, 253),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(30),
               ),
             ),
             child: const Text(
               "Edit Profile",
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 16,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
         ],
       ),
     ),
   );
 }

 // Function to show the dialog to edit username
 Future<String?> _showUsernameDialog() async {
   TextEditingController usernameController = TextEditingController();
   return showDialog<String>(
     context: context,
     builder: (BuildContext context) {
       return AlertDialog(
         title: const Text("Enter a new username"),
         content: TextField(
           controller: usernameController,
           decoration: const InputDecoration(
             hintText: "New username",
           ),
         ),
         actions: <Widget>[
           TextButton(
             onPressed: () {
               Navigator.of(context).pop(usernameController.text);
             },
             child: const Text("Save"),
           ),
           TextButton(
             onPressed: () {
               Navigator.of(context).pop(null);
             },
             child: const Text("Cancel"),
           ),
         ],
       );
     },
   );
 }
}


