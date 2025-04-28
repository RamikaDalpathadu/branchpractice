import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 8, 88, 68),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title: const Text(
                  "Home",
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
            ],
          ),
        ],
      ),
    );
  }
}
