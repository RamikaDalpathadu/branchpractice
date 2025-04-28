import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: const Color(0xFF54B0A8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name TextField
            const TextField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            // Mobile TextField
            const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Mobile",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 20),

            // Email TextField
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),

            // Password TextField
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 30),

            // Sign In Button
            ElevatedButton(
              onPressed: () {
                // Add your sign-in logic here
                print("Sign In button pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF54B0A8),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "SIGN UP",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Back Button
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              child: const Text(
                "Back to Welcome Screen",
                style: TextStyle(fontSize: 16, color: Color(0xFF54B0A8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
