import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // Removed unused screenWidth variable

    return Scaffold(
      body: Container(
        // Gradient background for the entire screen
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // White
              Color(0xFF80CBC4), // Teal
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: screenHeight - MediaQuery.of(context).padding.top,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFFFFFF), Color(0xFF80CBC4)],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Image.asset(
                      'assets/trieasenew.png',
                      height: screenHeight * 0.15,
                    ),
                    const SizedBox(height: 30),
                    Image.asset(
                      'assets/logonew.png',
                      height: screenHeight * 0.35,
                    ),
                    const SizedBox(height: 30),
                    // Sign In Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignInScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF54B0A8),
                        minimumSize: const Size(150, 40), // Adjusted size
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ), // Adjusted font size
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUpScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF54B0A8),
                        minimumSize: const Size(150, 40), // Adjusted size
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ), // Adjusted font size
                      ),
                    ),

                    // Close the Column widget's children list
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
