import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class LeafCatcherGame extends StatefulWidget {
  const LeafCatcherGame({super.key});

  @override
  _LeafCatcherGameState createState() => _LeafCatcherGameState();
}

class _LeafCatcherGameState extends State<LeafCatcherGame> {
  double basketX = 0.0; // -1 (left) to 1 (right)
  double leafX = 0.0;
  double leafY = -1.0;
  bool caught = false;
  Timer? fallTimer;
  Random random = Random();
  int score = 0;
  int lives = 3; // Number of lives

  @override
  void initState() {
    super.initState();
    startFallingLeaf();
  }

  void startFallingLeaf() {
    if (lives <= 0) return; // Stop the game if no lives are left

    leafX = random.nextDouble() * 2 - 1; // Random X position
    leafY = -1.0;
    caught = false;
    fallTimer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {
        leafY += 0.02;
        if (leafY >= 0.85 && (leafX - basketX).abs() < 0.2) {
          caught = true;
          score++;
          fallTimer?.cancel();
          Future.delayed(Duration(milliseconds: 500), startFallingLeaf);
        } else if (leafY > 1.2) {
          // Leaf missed
          fallTimer?.cancel();
          lives--; // Decrease a life
          if (lives > 0) {
            Future.delayed(Duration(milliseconds: 500), startFallingLeaf);
          } else {
            _showGameOverDialog(); // Show Game Over dialog
          }
        }
      });
    });
  }

  void moveBasket(DragUpdateDetails details, BoxConstraints constraints) {
    setState(() {
      basketX += details.delta.dx / (constraints.maxWidth / 2);
      basketX = basketX.clamp(-1.0, 1.0);
    });
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('Your score: $score\nLives: $lives'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      score = 0;
      lives = 3;
    });
    startFallingLeaf();
  }

  @override
  void dispose() {
    fallTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onHorizontalDragUpdate:
                (details) => moveBasket(details, constraints),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.teal.shade800, Colors.teal.shade900],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * leafY,
                  left:
                      (MediaQuery.of(context).size.width / 2) * (1 + leafX) -
                      30, // Adjusted for larger size
                  child: Icon(
                    Icons.eco,
                    size: 60, // Increased size of the leaf
                    color: caught ? Colors.greenAccent : Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left:
                      (MediaQuery.of(context).size.width / 2) * (1 + basketX) -
                      60, // Adjusted for larger size
                  child: Container(
                    width: 120, // Increased width of the basket
                    height: 60, // Increased height of the basket
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(
                        30,
                      ), // Adjusted for larger size
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 4),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.shopping_basket,
                        color: Colors.white,
                        size: 40,
                      ), // Adjusted icon size
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: Text(
                    "Score: $score\nLives: $lives",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
