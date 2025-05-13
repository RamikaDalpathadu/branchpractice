import 'package:flutter/material.dart';
import 'package:triease_app/pages/welcomescreen.dart'; // Import the HomePage

void main() => runApp(const TrieaseApp());

class TrieaseApp extends StatelessWidget {
  const TrieaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TriEase App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const WelcomeScreen(),
    );
  }
}
