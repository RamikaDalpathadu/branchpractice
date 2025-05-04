import 'package:flutter/material.dart';
import 'package:triease_app/pages/welcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TrieaseApp());
}

class TrieaseApp extends StatelessWidget {
  const TrieaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Triease App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const WelcomeScreen(), // Set WelcomeScreen as the initial screen
    );
  }
}
