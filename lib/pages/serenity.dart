import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ImmersiveSerenityPage extends StatelessWidget {
  const ImmersiveSerenityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/beachcover.png', fit: BoxFit.cover),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Immersive Serenity Mode",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        "Choose your favorite peaceful scenery, plug in your earphones, and let your senses drift away with immersive 8D audio.\n\nWhile you relax, your TriEase band syncs massage patterns synced to the sound.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/yogaimage.png'),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SceneSelectionPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Choose Scene'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Breath | Relax | Heal",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Page 2: Scene Selection
class SceneSelectionPage extends StatelessWidget {
  const SceneSelectionPage({super.key});

  final List<Map<String, String>> scenes = const [
    {"name": "Forest Walk", "image": "assets/forest2.png"},
    {"name": "Beach", "image": "assets/beach.png"},
    {"name": "Rain", "image": "assets/rain.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "Select Scenery",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.teal.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: scenes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => AudioSelectionPage(
                          sceneName: scenes[index]['name']!,
                        ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        scenes[index]['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      scenes[index]['name']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Page 3: Audio Selection Page
class AudioSelectionPage extends StatelessWidget {
  final String sceneName;
  const AudioSelectionPage({required this.sceneName, super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> audios = [];

    if (sceneName == "Forest Walk") {
      audios = [
        {"name": "Forest Calm", "file": "audios/af1.mp3"},
        {"name": "Forest Deep", "file": "audios/af2.mp3"},
        {"name": "Forest Mystic", "file": "audios/af3.mp3"},
      ];
    } else if (sceneName == "Beach") {
      audios = [
        {"name": "Beach Waves", "file": "audios/ab1.mp3"},
        {"name": "Beach Breeze", "file": "audios/ab2.mp3"},
        {"name": "Beach Sunset", "file": "audios/ab3.mp3"},
      ];
    } else if (sceneName == "Rain") {
      audios = [
        {"name": "Rain Soft", "file": "audios/ar1.mp3"},
        {"name": "Rain Calm", "file": "audios/ar2.mp3"},
        {"name": "Rain Heavy", "file": "audios/ar3.mp3"},
      ];
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "Choose Sound",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: audios.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => ScenePlayPage(
                        sceneName: sceneName,
                        audioFile: audios[index]['file']!,
                      ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  audios[index]['name']!,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Page 4: Scene Play Page (Music Player)
class ScenePlayPage extends StatefulWidget {
  final String sceneName;
  final String audioFile;
  const ScenePlayPage({
    required this.sceneName,
    required this.audioFile,
    super.key,
  });

  @override
  ScenePlayPageState createState() => ScenePlayPageState();
}

class ScenePlayPageState extends State<ScenePlayPage> {
  late AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    playMusic();
    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });
    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });
  }

  void playMusic() async {
    await _audioPlayer.play(AssetSource(widget.audioFile), volume: 0.8);
    setState(() {
      isPlaying = true;
    });
  }

  void pauseMusic() async {
    await _audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void resumeMusic() async {
    await _audioPlayer.resume();
    setState(() {
      isPlaying = true;
    });
  }

  void seekMusic(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Breath In\nLet GO",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            FadeInImage(
              placeholder: const AssetImage('assets/audio.png'),
              image: const AssetImage('assets/audio.png'),
              height: 120,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),

            // Music Slider
            Slider(
              min: 0,
              max: _duration.inSeconds.toDouble(),
              value: _position.inSeconds.toDouble().clamp(
                0,
                _duration.inSeconds.toDouble(),
              ),
              onChanged: (value) {
                final position = Duration(seconds: value.toInt());
                seekMusic(position);
              },
              activeColor: Colors.white,
              inactiveColor: Colors.white38,
            ),

            // Time Texts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(_position),
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  formatTime(_duration),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Play / Pause Button
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                size: 70,
                color: Colors.white,
              ),
              onPressed: () {
                if (isPlaying) {
                  pauseMusic();
                } else {
                  resumeMusic();
                }
              },
            ),

            const Spacer(),

            // Bottom Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _audioPlayer.stop();
                    Navigator.pop(context);
                  },
                  child: const Text('Change Audio'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _audioPlayer.stop();
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text('End Session'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
