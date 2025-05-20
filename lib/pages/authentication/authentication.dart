import 'package:flutter/material.dart';
import 'package:triease_app/pages/authentication/sign_up_screen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signinPage = true;

  //toogle pages

  void switchPages() {
    setState(() {
      signinPage != signinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SignUpScreen();
  }
}
