import 'package:flutter/material.dart';
import 'package:triease_app/pages/settings_page.dart';
import 'package:triease_app/pages/shop_page.dart';
import 'package:triease_app/pages/editprofile.dart'; // Import the EditProfilePage
import 'package:triease_app/pages/updates.dart';
import 'package:triease_app/widgets/side_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // Add UpdatePage to the list of pages
  final List<Widget> _pages = [
    const ShopPage(),
    const SettingsPage(),
    const UpdatePage(), // Add UpdatePage here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Allows the bottom navigation bar to float
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00C6FF), // Modern gradient start color
              Color(0xFF0072FF), // Modern gradient end color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: IndexedStack(index: selectedIndex, children: _pages),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "TriEase",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black), // Profile icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          const EditProfilePageStateless(), // Navigate to EditProfilePage
                ),
              );
            },
          ),
        ],
      ),
      drawer: const SideBar(),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
        ), // Horizontal margin only
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20), // Slightly rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 10), // Shadow below the navigation bar
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            20,
          ), // Match the container's radius
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: navigateBottomBar,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 211, 236, 231),
            selectedItemColor: const Color.fromARGB(
              255,
              18,
              90,
              78,
            ), // Modern blue color
            unselectedItemColor: const Color.fromARGB(255, 76, 187, 168),
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 28), // Slightly larger icons
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 28),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.update, size: 28),
                label: 'Updates',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
