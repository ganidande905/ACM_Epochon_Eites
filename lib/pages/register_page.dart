import 'package:app/components/my_button.dart';
import 'package:app/components/my_social_icon.dart';
import 'package:app/components/my_textfield.dart';
import 'package:app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  void login() {
    // Navigate to Home Page or execute login logic
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void register_message() {
     ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully registered, head back to login page')),
        // duration: const Duration(seconds: 2),
        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3D3D3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              color: const Color(0xFF6F946B), // Green background
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // White Login Card
            Container(
              transform: Matrix4.translationValues(0, -20, 0),
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Login Text
                    Text(
                      "Register a new account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Social Login Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MySocialIcon(
                          icon: FontAwesomeIcons.apple, // Apple icon
                          color: Colors.black,
                          onTap: () {},
                        ),
                        const SizedBox(width: 20),
                        MySocialIcon(
                          icon:
                              FontAwesomeIcons.google, // Replace with "X" icon
                          color: const Color.fromARGB(255, 255, 0, 30),
                          onTap: () {},
                        ),
                        const SizedBox(width: 20),
                        MySocialIcon(
                          icon: FontAwesomeIcons.xTwitter,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Text(
                      "or use your email account",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    const SizedBox(height: 20),
                    // Email and Password TextFields
                    MyTextfield(
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    MyTextfield(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    MyTextfield(
                      controller: confirmPasswordController,
                      hintText: "Confirm Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    // Login Button
                    ElevatedButton(
                      onPressed: register_message,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6F946B), // Green color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 100),
                      ),
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Register Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: login,
                          child: const Text(
                            "Login here",
                            style: TextStyle(
                              color: Color(0xFF6F946B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
