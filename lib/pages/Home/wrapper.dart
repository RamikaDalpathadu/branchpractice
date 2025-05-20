import 'package:flutter/material.dart';
import 'package:triease_app/pages/Home/home_page.dart';
import 'package:triease_app/pages/authentication/authentication.dart';
import 'package:provider/provider.dart';
import 'package:triease_app/models/usermodel.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          final user = Provider.of<UserModel?>(context);
          if (user == null) {
            return Authenticate();
          } else {
            return HomePage();
          }
        },
      ),
    );
  }
}
