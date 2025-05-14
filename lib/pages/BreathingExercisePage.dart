import 'dart:math';
import 'package:flutter/material.dart';

class BreathingExercisePage extends StatefulWidget {
  const BreathingExercisePage({super.key});

  @override
  State<BreathingExercisePage> createState() => _BreathingExercisePageState();
}

class _BreathingExercisePageState extends State<BreathingExercisePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bubbleSizeAnimation;
  final List<Widget> _bubbles = [];
  bool _isHolding = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // 5 seconds for inhale
    );

    _bubbleSizeAnimation = Tween<double>(
      begin: 50,
      end: 200,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _onInhaleStart() {
    setState(() {
      _isHolding = true;
    });
    _controller.forward();
  }

  void _onExhaleRelease() {
    setState(() {
      _isHolding = false;
    });

    // Add a new bubble to the screen
    final bubble = PositionedBubble(
      size: _bubbleSizeAnimation.value,
      key: UniqueKey(),
    );

    setState(() {
      _bubbles.add(bubble);
    });

    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bubble Breathing Game'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFB2EBF2), // Light blue
                  Color(0xFF80DEEA), // Teal
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Existing bubbles
          ..._bubbles,
          // Center bubble animation
          Center(
            child: AnimatedBuilder(
              animation: _bubbleSizeAnimation,
              builder: (context, child) {
                return Container(
                  width: _bubbleSizeAnimation.value,
                  height: _bubbleSizeAnimation.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.5),
                  ),
                );
              },
            ),
          ),
          // Inhale/Exhale button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: GestureDetector(
                onTapDown: (_) => _onInhaleStart(),
                onTapUp: (_) => _onExhaleRelease(),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isHolding ? Colors.green : Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      _isHolding ? 'Inhale' : 'Exhale',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PositionedBubble extends StatefulWidget {
  final double size;

  const PositionedBubble({super.key, required this.size});

  @override
  State<PositionedBubble> createState() => _PositionedBubbleState();
}

class _PositionedBubbleState extends State<PositionedBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _verticalAnimation;
  late Animation<double> _horizontalAnimation;
  late double _randomHorizontalOffset;

  @override
  void initState() {
    super.initState();

    // Generate a random horizontal offset for the bubble
    final random = Random();
    _randomHorizontalOffset = random.nextDouble() * 2 - 1; // Range: -1.0 to 1.0

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ), // Duration for the bubble to float up
    );

    // Vertical animation: Float from bottom to top
    _verticalAnimation = Tween<double>(
      begin: 1.0, // Start at the bottom
      end: 0.0, // Float to the top
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Horizontal animation: Bounce slightly left or right
    _horizontalAnimation = Tween<double>(
      begin: 0.0,
      end: _randomHorizontalOffset * 0.5, // Move left or right randomly
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          bottom: MediaQuery.of(context).size.height * _verticalAnimation.value,
          left:
              MediaQuery.of(context).size.width / 2 +
              MediaQuery.of(context).size.width * _horizontalAnimation.value -
              widget.size / 2,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withOpacity(0.5),
            ),
          ),
        );
      },
    );
  }
}
