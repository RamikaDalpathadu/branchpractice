import 'package:flutter/material.dart';
import 'package:triease_app/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  IntroPageState createState() => IntroPageState(); // Made the state class public
}

class IntroPageState extends State<IntroPage> {
  // Removed the underscore to make it public
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await performHeavyTask(); // Perform heavy tasks asynchronously
    });
  }

  Future<void> performHeavyTask() async {
    // Simulate a heavy task
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              const SizedBox(height: 48),

              //title
              Text(
                "Just Do It",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 24),

              //sub title
              Text(
                "Brand new Sneakers and custom kicks made with premium Quality",
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 145, 6, 6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              //start now button
              GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 61, 4, 4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(25),

                  child: Center(
                    child: Text(
                      "Shop Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
