import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class StreaksPage extends StatefulWidget {
  const StreaksPage({super.key});

  @override
  _StreaksPageState createState() => _StreaksPageState();
}

class _StreaksPageState extends State<StreaksPage> {
  int streakCount = 0;
  String lastCheckedDate = "Never checked";

  @override
  void initState() {
    super.initState();
    _loadStreakData();
  }

  // Load streak data from SharedPreferences
  Future<void> _loadStreakData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedDate = prefs.getString('lastCheckedDate');
    int storedStreakCount = prefs.getInt('streakCount') ?? 0;

    // Get today's date in string format
    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // If the stored date is different from today's date, update the streak
    if (storedDate != todayDate) {
      if (storedDate != null && _isConsecutiveDay(storedDate, todayDate)) {
        // Increment streak if consecutive days
        storedStreakCount++;
      } else {
        // Reset streak to 1 if not consecutive or no previous date exists
        storedStreakCount = 1;
      }

      // Save today's date and streak count to SharedPreferences
      await prefs.setString('lastCheckedDate', todayDate);
      await prefs.setInt('streakCount', storedStreakCount);
    }

    setState(() {
      streakCount = storedStreakCount;
      lastCheckedDate = storedDate ?? "Never checked";
    });
  }

  // Check if the last date is exactly one day before today
  bool _isConsecutiveDay(String lastDate, String todayDate) {
    DateTime lastChecked = DateFormat('yyyy-MM-dd').parse(lastDate);
    DateTime today = DateFormat('yyyy-MM-dd').parse(todayDate);
    return today.difference(lastChecked).inDays == 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Streaks"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Streak Count
            Text(
              "Your Current Streak: $streakCount day(s)",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Display Last Checked Date
            Text(
              "Last Checked: $lastCheckedDate",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),

            // Button to simulate a fitness check (to update streak)
            ElevatedButton(
              onPressed: _loadStreakData, // Refresh streak data
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Check Today's Fitness",
                style: TextStyle(
                  color: Colors.white,
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
}
