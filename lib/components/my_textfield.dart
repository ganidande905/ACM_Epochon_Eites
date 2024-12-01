import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText, // Hint text for the input field
        hintStyle: TextStyle(color: Colors.grey[500]), // Hint text color
        filled: true, // Enables a filled background
        fillColor: Colors.grey[200], // Light grey background color
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Padding inside the text field
      ),
    );
  }
}
