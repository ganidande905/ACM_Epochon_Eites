import 'package:app/components/my_drawer.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: const Text("WELCOME!"),
      backgroundColor: Colors.white,
      centerTitle: true,
      ),
      drawer: const MyDrawer(),
      
    );

  }
}