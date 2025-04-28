import 'package:flutter/material.dart';

void main() {
  runApp(GamingInterface());
}

class GamingInterface extends StatelessWidget {
  const GamingInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 143, 226, 205), // Start color
            Color.fromARGB(255, 46, 179, 159), // End color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Make Scaffold background transparent
        appBar: AppBar(
          title: const Text('Welcome Back'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Play a game to relax', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text('Quick Start')),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: const [
                  GameButton(icon: Icons.extension, title: 'Puzzle'),
                  GameButton(icon: Icons.grain, title: 'Breathing Exercises'),
                  GameButton(icon: Icons.track_changes, title: 'Focus Games'),
                  GameButton(
                    icon: Icons.self_improvement,
                    title: 'Mindfulness',
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Update'),
          ],
        ),
      ),
    );
  }
}

class GameButton extends StatelessWidget {
  final IconData icon;
  final String title;

  const GameButton({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50),
              const SizedBox(height: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
