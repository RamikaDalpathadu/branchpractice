import 'package:flutter/material.dart';

class PlaylistsPage extends StatelessWidget {
  const PlaylistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore Playlists',
          style: TextStyle(
            fontSize: 18, // Smaller font size
            fontWeight: FontWeight.w600, // Semi-bold font weight
            fontFamily: 'Roboto', // Nicer font style
          ),
        ),
        backgroundColor: const Color.fromARGB(
          255,
          143,
          221,
          208,
        ), // Custom AppBar color
        elevation: 0, // Remove shadow
      ),
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Add spacing at the top
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Add spacing below the search bar
            // Playlist Items
            Expanded(
              child: ListView(
                children: [
                  _buildVerticalItem(context, 'Controller'),
                  _buildVerticalItem(context, 'Immersive Serenity'),
                  _buildVerticalItem(context, 'Music'),
                  _buildVerticalItem(context, 'Games'),
                  _buildVerticalItem(context, 'Care Map'),
                  _buildVerticalItem(context, 'Relaxing Stories'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalItem(BuildContext context, String title) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10),
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
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
