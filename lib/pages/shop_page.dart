import 'package:flutter/material.dart';
import 'package:triease_app/pages/controller_page.dart';
import 'package:triease_app/pages/game_interface.dart';
import 'package:triease_app/pages/immersive_serenity.dart';
import 'package:triease_app/pages/music_interface.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255), // Start color
            Color.fromARGB(255, 24, 172, 147), // End color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SizedBox(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search', style: TextStyle(color: Colors.grey)),
                  Icon(Icons.search, color: Colors.grey[600]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Center(
                child: Text(
                  'TriEase | 3 in 1 Muscle Reliever | Relief On The GO',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recently Used',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildSquareItem('Music'),
                  _buildSquareItem('Relax Stories'),
                  _buildSquareItem('Controller'),
                  _buildSquareItem(' Serenity'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Explore Your Interests 🪷🪷🪷',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildVerticalItem(context, 'Controller', Icons.gamepad),
                  _buildVerticalItem(context, 'Immersive Serenity', Icons.spa),
                  _buildVerticalItem(context, 'Music', Icons.music_note),
                  _buildVerticalItem(context, 'Games', Icons.videogame_asset),
                  _buildVerticalItem(context, ' Care Map', Icons.map),
                  _buildVerticalItem(context, 'Relaxing Stories', Icons.book),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareItem(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 13, 153, 139),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalItem(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (title == 'Controller') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ControllerPage()),
          );
        }
        if (title.trim() == 'Immersive Serenity') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SerenityPage()),
          );
        }
        if (title.trim() == 'Music') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MusicPage()),
          );
        }
        if (title.trim() == 'Games') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GamingInterface()),
          );
        }
        // Add more conditions for other pages if needed
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10),
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 85, 189, 163), // Start color
                Color.fromARGB(255, 110, 226, 207), // End color
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.black, size: 30),
              const SizedBox(
                width: 10,
              ), // Add spacing between the icon and text
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
