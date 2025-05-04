import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';

// Firebase Realtime Database reference
final databaseRef = FirebaseDatabase.instance.ref();

// Function to toggle the motor ON/OFF
void toggleMotor(bool isOn) {
  databaseRef.child("motor").set({"status": isOn ? "ON" : "OFF"});
}

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
                  _buildNonInteractiveSquareItem(
                    'Adjust the vibration intensity to your comfort. Slide to control the strength for a personalized relaxation experience',
                    width: 300, // Larger width
                    height: 100, // Larger height
                    color: const Color.fromARGB(255, 191, 233, 222),
                  ),
                  const SizedBox(height: 80.0),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildSquareItem(context, 'Low', width: 120),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildSquareItem(context, 'Medium', width: 120),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildSquareItem(context, 'High', width: 120),
                  ),
                  const SizedBox(height: 40.0),

                  // Add the ON/OFF buttons
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed:
                              () => toggleMotor(true), // Turn ON the motor
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                          ),
                          child: const Text(
                            "Turn ON Motor",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed:
                              () => toggleMotor(false), // Turn OFF the motor
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                          ),
                          child: const Text(
                            "Turn OFF Motor",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
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

  // Helper method to build a non-interactive square item
  Widget _buildNonInteractiveSquareItem(
    String title, {
    double width = 80,
    double height = 60,
    Color color = const Color.fromARGB(214, 126, 231, 214),
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );
  }

  // Helper method to build an interactive square item
  Widget _buildSquareItem(
    BuildContext context,
    String title, {
    double width = 80,
    double height = 60,
    Color color = const Color.fromARGB(214, 126, 231, 214),
  }) {
    return GestureDetector(
      onTap: () async {
        if (title == 'Low') {
          // Send a request to the hardware device to turn on low vibration
          final response = await http.get(Uri.parse('http://<DEVICE_IP>/low'));
          if (response.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Low vibration turned ON')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to communicate with device'),
              ),
            );
          }
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
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
