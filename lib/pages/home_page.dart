import 'package:app/components/my_drawer.dart';
import 'package:flutter/material.dart';
// Assuming this file exists in your project

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> articles = [
    {
      "title": "Why is air quality deteriorating day by day?",
      "subtitle": "Understanding the Causes Behind Declining Air Quality Â· 4 Min Read Â· 7 Hours Ago",
      "content": "Air quality is declining due to pollution from vehicles, industries, and urbanization. Learn how to combat this with sustainable practices."
    },
    {
      "title": "How to Reduce Carbon Dioxide Emissions for a Better Environment",
      "subtitle": "Practical Steps to Lower COâ‚‚ Levels and Combat Climate Change Â· 6 Min Read Â· 12 Hours Ago",
      "content": "Reducing COâ‚‚ emissions involves using renewable energy, conserving electricity, and planting trees."
    },
    {
      "title": "The Role of Trees in Reducing Carbon Emissions",
      "subtitle": "Planting Trees to Absorb COâ‚‚ and Foster a Greener Planet Â· 3 Min Read Â· 15 Hours Ago",
      "content": "Trees absorb carbon dioxide and provide oxygen. Learn about reforestation's impact on a healthier planet."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      drawer: MyDrawer(onTap: () {  },), // Use the custom drawer
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color.fromARGB(176, 14, 119, 7),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Top Section with Air Quality
          Container(
            color: const Color.fromARGB(176, 14, 119, 7),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.air, color: Colors.white, size: 32),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Air Quality Index: Good",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "AQI: 50 - Safe for outdoor activities",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "CarbonX",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Your Sustainability Progress",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.65, // Example progress value
                          backgroundColor: Colors.white24,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(167, 41, 213, 10),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "65/100 COâ‚‚",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Activity",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _activityTile(
                  "Transport Usage",
                  "Track your COâ‚‚ emissions from transport.",
                  Icons.directions_car,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ActionDetailsPage(
                          title: "Transport Usage",
                          usage: "You emitted 25kg of COâ‚‚ this week.",
                          suggestions: [
                            "Use public transport whenever possible.",
                            "Carpool with friends or colleagues.",
                            "Consider walking or cycling short distances.",
                          ],
                        ),
                      ),
                    );
                  },
                ),
                _activityTile(
                  "Energy Usage",
                  "Track your household energy consumption.",
                  Icons.flash_on,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ActionDetailsPage(
                          title: "Energy Usage",
                          usage: "You consumed 120kWh this week.",
                          suggestions: [
                            "Switch to energy-efficient appliances.",
                            "Turn off lights and devices when not in use.",
                            "Use renewable energy sources like solar panels.",
                          ],
                        ),
                      ),
                    );
                  },
                ),
                _activityTile(
                  "Water Usage",
                  "Track your water consumption.",
                  Icons.water_drop,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ActionDetailsPage(
                          title: "Water Usage",
                          usage: "You used 150 liters of water today.",
                          suggestions: [
                            "Fix leaks to prevent water waste.",
                            "Install low-flow showerheads and faucets.",
                            "Use a bucket instead of a hose for car washing.",
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Just For You",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "See More",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ...articles.map((article) => _articleCard(
                      title: article["title"]!,
                      subtitle: article["subtitle"]!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetailsPage(
                              title: article["title"]!,
                              content: article["content"]!,
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _activityTile(String title, String description, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green.withOpacity(0.1),
              child: Icon(icon, color: Colors.green),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _articleCard({required String title, required String subtitle, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleDetailsPage extends StatelessWidget {
  final String title;
  final String content;

  const ArticleDetailsPage({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(176, 14, 119, 7),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          content,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}

class ActionDetailsPage extends StatelessWidget {
  final String title;
  final String usage;
  final List<String> suggestions;

  const ActionDetailsPage({
    super.key,
    required this.title,
    required this.usage,
    required this.suggestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(176, 14, 119, 7),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              usage,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Suggestions:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...suggestions.map((suggestion) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "â€¢ $suggestion",
                    style: const TextStyle(fontSize: 16),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: const Color.fromARGB(176, 14, 119, 7),
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text(
          "No new notifications",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
