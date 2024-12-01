# 🌍 CarbonX - Your Personal Sustainability Sidekick 🌱
🚀 Overview

Welcome to CarbonX, the ultimate app for tracking and reducing your carbon footprint. From monitoring your daily activities to building eco-friendly habits, CarbonX helps you make sustainability a part of your lifestyle. Together, we can make small changes that lead to a big impact!
# ✨ Features
1. Activity Tracking

Track and analyze your environmental impact across key areas:

    🚗 Transport Usage: Calculate emissions from your daily commutes.
    ⚡ Energy Consumption: Monitor electricity usage and identify saving opportunities.
    💧 Water Usage: Track water consumption to promote mindful usage.

2. Habit Streaks

    Set daily sustainability goals and maintain streaks for consistency.
    Break a streak? Don’t worry—restart with ease and continue your journey.

3. Educational Content

    Access curated articles and tips on sustainability, covering topics like air quality, renewable energy, and the importance of biodiversity.

4. Custom Navigation Drawer

    Simple, intuitive navigation to access all features, including logout and settings.

5. Reminders and Notifications

    Get friendly reminders to stay on track with your goals.

# 🎨 User Interface Highlights

    Clean and Modern Design
        Intuitive layouts with a focus on usability.
        Progress bars and visuals to track your journey easily.

    Eco-Themed Colors
        Green accents for an environmentally friendly aesthetic.

    Dark Mode
        Optional dark theme for reduced screen strain.

# 🛠️ Technologies Used

    Flutter & Dart: To deliver a responsive and beautiful user experience.
    SharedPreferences: For storing user preferences, streaks, and progress locally.
    Intl Package: Handles date formatting and calculations for streak tracking.
# Getting started
    Prerequisites

    Install Flutter SDK.
    Set up an IDE (VS Code, Android Studio, etc.).

    Installation
    Clone the Repository
    Install Dependencies
    Run the App
# 📋 Features in Detail
1) Streak Logic
   Keep track of daily eco-friendly actions with smart streak detection
   bool _isConsecutiveDay(String lastDate, String todayDate) {  
  DateTime lastChecked = DateFormat('yyyy-MM-dd').parse(lastDate);  
  DateTime today = DateFormat('yyyy-MM-dd').parse(todayDate);  
  return today.difference(lastChecked).inDays == 1;  
}  

2) Navigation Drawer
    class MyDrawer extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Drawer(  
      child: Column(  
        children: [  
          ListTile(title: Text("Home"), onTap: () => Navigator.pop(context)),  
          ListTile(title: Text("Notifications"), onTap: () => Navigator.pop(context)),  
          ListTile(title: Text("Logout"),  
            onTap: () => Navigator.pushReplacement(  
              context,  
              MaterialPageRoute(builder: (context) => LoginPage()))),  
        ],  
      ),  
    );  
  }  
}  

3) Eco-Activity Tile
   A reusable widget for activity tracking
   Widget _activityTile(String title, String description, IconData icon, VoidCallback onTap) {  
  return GestureDetector(  
    onTap: onTap,  
    child: Container(  
      padding: const EdgeInsets.all(16),  
      decoration: BoxDecoration(  
        color: Colors.white,  
        borderRadius: BorderRadius.circular(15),  
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],  
      ),  
      child: Row(  
        children: [  
          Icon(icon, color: Colors.green),  
          SizedBox(width: 16),  
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),  
        ],  
      ),  
    ),  
  );  
}  
# 👨‍💻 Contributing
    We welcome contributions! Here’s how you can get involved:
    Fork the repository.
    Create a new branch 
    Commit your changes 
    Push to the branch 
    Open a pull request.
# 🙌 Acknowledgments

Special thanks to eco-conscious individuals and organizations for inspiring us to make this app. Let’s create a future where sustainability is second nature

    
