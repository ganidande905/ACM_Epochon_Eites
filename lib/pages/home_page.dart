import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // For graph support

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      drawer: const Drawer(), // Replace with your custom drawer
      body: Column(
        children: [
          // Top Section: Full Green Background
          Container(
            color: const Color.fromARGB(176, 14, 119, 7),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AppBar Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                        const Text(
                          "WELCOME!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                    const SizedBox(height: 20),

                    // Title and Progress
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
                          "65/100 CO₂",
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
          ),

          const SizedBox(height: 10),

          // Heading for Activity Section
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

          // My Activity Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  _activityTile(
                    "Transport Usage",
                    "Track your CO₂ emissions from transport.",
                    Icons.directions_car,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransportUsagePage(),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Activity Tile Widget
  Widget _activityTile(
      String title, String description, IconData icon, VoidCallback onTap) {
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
}

// Transport Usage Page with Graph
class TransportUsagePage extends StatelessWidget {
  const TransportUsagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transport Usage"),
        backgroundColor: const Color.fromARGB(255, 110, 175, 95),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Monthly Progress",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Colors.black26),
                      left: BorderSide(color: Colors.black26),
                    ),
                  ),
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 100,
                  lineBarsData: [
                   LineChartBarData(
  spots: const [
    FlSpot(0, 80),
    FlSpot(1, 75),
    FlSpot(2, 70),
    FlSpot(3, 65),
    FlSpot(4, 60),
    FlSpot(5, 55),
    FlSpot(6, 50),
    FlSpot(7, 45),
    FlSpot(8, 40),
    FlSpot(9, 35),
    FlSpot(10, 30),
    FlSpot(11, 25),
  ],
  isCurved: true,
   color: Colors.black54,// Corrected property
  barWidth: 3,
),
                    
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Suggestions to Reduce",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "• Use public transport whenever possible.\n"
              "• Carpool with friends or colleagues.\n"
              "• Consider walking or cycling short distances.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

// Generic Details Page
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
        backgroundColor: const Color.fromARGB(255, 110, 175, 95),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Usage",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              usage,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Suggestions to Reduce",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...suggestions.map((suggestion) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.check, color: Colors.green, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          suggestion,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

// Notification Page
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "No new notifications",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
