import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 143, 226, 205), // Start color
              Color.fromARGB(255, 19, 117, 103), // End color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Add an image at the top
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/trieasenew.png', // Replace with your image path
                height: 120, // Adjust the height as needed
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ), // Add spacing between the image and icons
            // List of icons in the middle-top
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the top
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.white),
                    title: const Text(
                      "Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info, color: Colors.white),
                    title: const Text(
                      "About",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.white),
                    title: const Text(
                      "Settings",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 390,
                  ), // Add spacing between the icons and logout
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white),
                    title: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            // Optional: Add a footer or leave empty space at the bottom
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
