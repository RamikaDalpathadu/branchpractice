import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final Function(int) onTabChange;

  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: onTabChange,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
      ],
    );
  }
}
