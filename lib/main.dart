import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triease_app/models/UserModel.dart';
import 'package:triease_app/pages/Home/wrapper.dart';
import 'package:triease_app/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TrieaseApp());
}

class TrieaseApp extends StatelessWidget {
  const TrieaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Usermodel?>.value(
      value: AuthServices().User,
      initialData: null,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
