import 'package:flutter/material.dart';
import 'package:triease_app/pages/BreathingExercisePage.dart';
import 'package:triease_app/pages/matchinggame.dart';
import 'comingsoon.dart';
import 'puzzlepage.dart'; // Import your PuzzlePage here

void main() {
  runApp(const GamingInterface());
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
                children: [
                  GameButton(
                    icon: Icons.extension,
                    title: 'Puzzle',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PuzzlePage(),
                        ),
                      );
                    },
                  ),
                  GameButton(
                    icon: Icons.grain,
                    title: 'Breathing Exercises',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BreathingExercisePage(),
                        ),
                      );
                    },
                  ),
                  GameButton(
                    icon: Icons.track_changes,
                    title: 'Focus Games',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MatchingGamePage(),
                        ),
                      );
                    },
                  ),
                  GameButton(
                    icon: Icons.self_improvement,
                    title: 'Mindfulness',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ComingSoonPage(),
                        ),
                      );
                    },
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
  final VoidCallback onTap; // Add onTap callback

  const GameButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap, // Require onTap callback
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap, // Trigger the onTap callback
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
