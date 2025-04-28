import 'package:flutter/material.dart';
import 'intensity_page.dart'; // Import the IntensityPage

class ControllerPage extends StatelessWidget {
  const ControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relaxation Controller')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 164, 224, 209), // Start color
              Color.fromARGB(255, 17, 129, 112), // End color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 180), // Spacing between image and title

            const SizedBox(height: 20), // Spacing between image and title
            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Select the Controlling Feature...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30), // Spacing between title and squares
            // Centered squares
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
        width: 80, // Adjusted width
        height: 60, // Adjusted height
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
              fontSize: 16, // Adjusted font size to fit smaller squares
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
