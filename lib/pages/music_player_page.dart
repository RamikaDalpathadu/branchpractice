import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerPage extends StatefulWidget {
  final String title;
  final String url;

  const MusicPlayerPage({super.key, required this.title, required this.url});

  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Check if the URL is a local file or a remote URL
    if (widget.url.startsWith('assets/')) {
      _audioPlayer.setAsset(widget.url); // Use setAsset for local files
    } else {
      _audioPlayer.setUrl(widget.url); // Use setUrl for remote URLs
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 31, 168, 134), // Start color
            Color.fromARGB(255, 6, 85, 73), // End color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.spa_rounded, color: Colors.white, size: 100),
              const SizedBox(height: 30),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _togglePlayPause,
                child: Text(isPlaying ? 'Pause' : 'Play'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
