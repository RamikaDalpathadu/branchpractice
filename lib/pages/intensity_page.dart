import 'package:flutter/material.dart';

class IntensityPage extends StatelessWidget {
  const IntensityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Intensity Level Controller')),
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
            // Horizontally scrollable items
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Change selected Feature :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100, // Height of the scrollable items
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildHorizontalItem('Intensity Level'),
                  const SizedBox(width: 16.0), // Spacing between items
                  _buildHorizontalItem('Vibrating Mode'),
                  const SizedBox(width: 16.0), // Spacing between items
                  _buildHorizontalItem('Temperature Adjustment'),
                  const SizedBox(width: 16.0), // Spacing between items
                  _buildHorizontalItem('Session Duration'),
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
                'Intensity Levels',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30), // Spacing between title and squares
            // Centered squares
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  // First box: Larger and lighter in color
                  _buildSquareItem(
                    'Adjust the vibration intensity to your comfort. Slide to control the strength for a personalized relaxation experience',
                    width: 300, // Larger width
                    height: 100, // Larger height
                    color: const Color.fromARGB(255, 191, 233, 222),
                  ),
                  const SizedBox(height: 80.0),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildSquareItem('Low', width: 120),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildSquareItem('Medium', width: 120),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildSquareItem('High', width: 120),
                  ),
                ],
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
      width: 140, // Width of each horizontal item
      height: 120, // Height of each horizontal item
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
  Widget _buildSquareItem(
    String title, {
    double width = 80,
    double height = 60,
    Color color = const Color.fromARGB(214, 126, 231, 214),
  }) {
    return Container(
      width: width, // Customizable width
      height: height, // Customizable height
      decoration: BoxDecoration(
        color: color, // Customizable color
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
    );
  }
}
