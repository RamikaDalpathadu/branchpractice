import 'package:flutter/material.dart';
import 'intensity_page.dart'; // Import the IntensityPage

class ControllerPage extends StatelessWidget {
  const ControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relaxation Controller')),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/controllerbg.png', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          // Foreground Content
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(
                    149,
                    219,
                    228,
                    225,
                  ), // Semi-transparent overlay
                  Color.fromARGB(149, 214, 230, 227),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    'assets/images/controllergirl.png',
                    height: 280,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Select the Controlling Feature...',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      _buildSquareItem(context, 'Intensity Level'),
                      const SizedBox(height: 25.0), // Add spacing between items
                      _buildSquareItem(context, 'Vibrating Mode'),
                      const SizedBox(height: 25.0), // Add spacing between items
                      _buildSquareItem(context, 'Temperature Adjustment'),
                      const SizedBox(height: 25.0), // Add spacing between items
                      _buildSquareItem(context, 'Session Duration'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a square item
  Widget _buildSquareItem(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        if (title == 'Intensity Level') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const IntensityPage()),
          );
        }
        // Add more conditions for other pages if needed
      },
      child: Container(
        width: 80,
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
