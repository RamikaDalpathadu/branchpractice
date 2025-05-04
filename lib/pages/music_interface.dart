import 'package:flutter/material.dart';
import 'package:triease_app/pages/music_player_page.dart';
import 'package:triease_app/pages/playlists_page.dart'; // Import the PlaylistsPage

class MusicPage extends StatelessWidget {
  MusicPage({super.key});

  // List of music tracks with their titles and URLs
  final List<Map<String, String>> musicTracks = [
    {
      'title': '"Weightless" – Marconi Union',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    },
    {
      'title': '"Sunrise" – Norah Jones',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    },
    {
      'title': '"Opus 55" – Dustin O Halloran',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
    },
    {
      'title': '"Night Owl" – Galimatias',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
    },
    {
      'title': '"Experience" – Ludovico Einaudi',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3',
    },
    {
      'title': '"Breathe Me" – Sia (Four Tet Remix)',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3',
    },
    {
      'title': '"In My Veins" – Andrew Belle',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relaxing Music')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 48, 194, 157), // Start color
              Color.fromARGB(255, 5, 99, 85), // End color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Spacing between image and title
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Featured Playlists 🎶',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlaylistsPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 6.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 22, 9, 143),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 22, 9, 143),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Horizontally scrollable items
            SizedBox(
              height: 100, // Height of the scrollable items
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildHorizontalItem('Playlist 1'),
                  const SizedBox(width: 16.0), // Spacing between items
                  _buildHorizontalItem('Playlist 2'),
                  const SizedBox(width: 16.0), // Spacing between items
                  _buildHorizontalItem('Playlist 3'),
                  const SizedBox(width: 16.0), // Spacing between items
                  _buildHorizontalItem('Playlist 4'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ), // Spacing between scrollable items and title
            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Top Tracks',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30), // Spacing between title and squares
            // Centered squares
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: musicTracks.length,
                itemBuilder: (context, index) {
                  final track = musicTracks[index];
                  return Column(
                    children: [
                      _buildSquareItem(context, track['title']!, track['url']!),
                      const SizedBox(height: 25.0), // Add spacing between items
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a horizontal item
  Widget _buildHorizontalItem(String title) {
    return Container(
      width: 100, // Width of each horizontal item
      height: 80, // Height of each horizontal item
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Helper method to build a square item
  Widget _buildSquareItem(BuildContext context, String title, String url) {
    return GestureDetector(
      onTap: () {
        print('Navigating to MusicPlayerPage with URL: $url');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MusicPlayerPage(title: title, url: url),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(214, 126, 231, 214),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
