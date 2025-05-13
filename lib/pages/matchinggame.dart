import 'package:flutter/material.dart';

class MatchingGamePage extends StatefulWidget {
  const MatchingGamePage({super.key});

  @override
  State<MatchingGamePage> createState() => _MatchingGamePageState();
}

class _MatchingGamePageState extends State<MatchingGamePage> {
  // List of images (6 unique images, duplicated to make pairs)
  final List<String> _images = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image5.png',
    'assets/images/image6.png',
  ];

  late List<String> _shuffledImages;
  List<bool> _revealed = [];
  List<int> _selectedIndices = [];
  List<bool> _matched = [];

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    // Duplicate and shuffle the images
    _shuffledImages = [..._images, ..._images]..shuffle();
    _revealed = List<bool>.filled(_shuffledImages.length, false);
    _matched = List<bool>.filled(_shuffledImages.length, false);
    _selectedIndices = [];
  }

  void _onTileTap(int index) {
    if (_revealed[index] || _matched[index] || _selectedIndices.length == 2) {
      return; // Ignore taps on already revealed or matched tiles
    }

    setState(() {
      _revealed[index] = true;
      _selectedIndices.add(index);
    });

    if (_selectedIndices.length == 2) {
      _checkMatch();
    }
  }

  void _checkMatch() {
    final int firstIndex = _selectedIndices[0];
    final int secondIndex = _selectedIndices[1];

    if (_shuffledImages[firstIndex] == _shuffledImages[secondIndex]) {
      // Match found
      setState(() {
        _matched[firstIndex] = true;
        _matched[secondIndex] = true;
      });

      // Check if all pairs are matched
      if (_matched.every((matched) => matched)) {
        _showCongratulationsPopup();
      }
    } else {
      // No match, hide the tiles after a short delay
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _revealed[firstIndex] = false;
          _revealed[secondIndex] = false;
        });
      });
    }

    // Clear the selected indices
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _selectedIndices.clear();
      });
    });
  }

  void _showCongratulationsPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: const Text('You matched all the pairs!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the popup
                Navigator.pop(context); // Go back to the home page
              },
              child: const Text('Back to Home'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the popup
                setState(() {
                  _initializeGame(); // Restart the game
                });
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Matching Game'), centerTitle: true),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(
                255,
                134,
                240,
                231,
              ), // Replace with your homepage gradient colors
              Color.fromARGB(255, 62, 231, 203),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Flip the cards and find all the matching pairs!',

                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 22, 117, 105),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 4 columns
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _shuffledImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onTileTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            _matched[index]
                                ? Colors.transparent
                                : const Color.fromARGB(
                                  255,
                                  7,
                                  70,
                                  56,
                                ), // Transparent if matched
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child:
                          _revealed[index] || _matched[index]
                              ? Image.asset(
                                _shuffledImages[index],
                                fit: BoxFit.cover,
                              )
                              : const Center(
                                child: Icon(
                                  Icons.question_mark,
                                  color: Color.fromARGB(255, 90, 228, 205),
                                  size: 40,
                                ),
                              ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
