import 'package:flutter/material.dart';
import 'package:triease_app/services/auth.dart';
import '../editprofile.dart'; // Import the EditProfilePage

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInStatus();
}

class _SignInStatus extends State<SignInScreen> {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: const Color(0xFF54B0A8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Email TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Password TextField
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Add your forgot password logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Forgot Password clicked!')),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color(0xFF54B0A8), fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sign In Button
            ElevatedButton(
              onPressed: () async {
                dynamic resulut = await _auth.signInAnonymously();
                if (resulut == Null) {
                  print("error in sign in anon");
                } else {
                  print("sign in anon");
                  print(resulut);
                }
                // Navigate to Edit Profile Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfilePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF54B0A8),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'SIGN IN',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
