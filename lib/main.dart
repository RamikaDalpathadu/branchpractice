import 'package:flutter/material.dart';
import 'package:triease_app/pages/welcomescreen.dart';

void main() {
  runApp(const TrieaseApp());
}

class TrieaseApp extends StatelessWidget {
  const TrieaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
