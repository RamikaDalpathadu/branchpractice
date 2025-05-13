import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  final int gridSize = 3;
  late List<Image> puzzlePieces;
  late List<int> correctOrder;
  late List<int> currentOrder;

  @override
  void initState() {
    super.initState();
    _initializePuzzle();
  }

  void _initializePuzzle() {
    // Load the puzzle pieces
    puzzlePieces = List.generate(
      gridSize * gridSize,
      (index) => Image.asset('assets/images/puzzle_piece_$index.jpg'),
    );

    // Set the correct order and shuffle for the current order
    correctOrder = List.generate(gridSize * gridSize, (index) => index);
    currentOrder = List.from(correctOrder)..shuffle();
  }

  bool _isPuzzleSolved() {
    return ListEquality().equals(correctOrder, currentOrder);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle Game'),
        backgroundColor: const Color.fromARGB(255, 72, 182, 167), // Teal color
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Drag and Drop to Solve the Puzzle!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridSize,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: puzzlePieces.length,
              itemBuilder: (context, index) {
                final pieceIndex = currentOrder[index];
                return DragTarget<int>(
                  onAccept: (data) {
                    setState(() {
                      final draggedIndex = currentOrder.indexOf(data);
                      currentOrder[draggedIndex] = currentOrder[index];
                      currentOrder[index] = data;
                    });

                    if (_isPuzzleSolved()) {
                      _showWinDialog();
                    }
                  },
                  builder: (context, candidateData, rejectedData) {
                    return Draggable<int>(
                      data: pieceIndex,
                      feedback: SizedBox(
                        width: MediaQuery.of(context).size.width / gridSize,
                        height: MediaQuery.of(context).size.width / gridSize,
                        child: puzzlePieces[pieceIndex],
                      ),
                      childWhenDragging: Container(
                        color: const Color.fromARGB(255, 66, 25, 25),
                      ),
                      child: puzzlePieces[pieceIndex],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: const Text('You solved the puzzle!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _initializePuzzle();
                });
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }
}
