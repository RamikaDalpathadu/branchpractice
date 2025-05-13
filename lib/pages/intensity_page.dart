import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IntensityPage extends StatefulWidget {
  const IntensityPage({super.key});

  @override
  State<IntensityPage> createState() => _IntensityPageState();
}

class _IntensityPageState extends State<IntensityPage> {
  bool isDeviceOn = false; // Track the state of the switch

  // Function to toggle the device ON/OFF
  Future<void> toggleDevice(bool isOn) async {
    final url =
        isOn
            ? 'http://192.168.180.41/on' // API endpoint to turn the device ON
            : 'http://192.168.180.41/off'; // API endpoint to turn the device OFF

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isOn ? 'Device turned ON' : 'Device turned OFF'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to communicate with device')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error communicating with device')),
      );
    }
  }

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
            // Add the switch
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Device Control:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: isDeviceOn,
                    onChanged: (value) {
                      setState(() {
                        isDeviceOn = value;
                      });
                      toggleDevice(value); // Call the toggleDevice function
                    },
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Spacing between switch and title
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
        String url = '';
        if (title == 'Low') {
          url = 'http://192.168.180.41/low'; // API endpoint for Low intensity
        } else if (title == 'Medium') {
          url =
              'http://192.168.180.41/medium'; // API endpoint for Medium intensity
        } else if (title == 'High') {
          url = 'http://192.168.180.41/high'; // API endpoint for High intensity
        }

        if (url.isNotEmpty) {
          try {
            final response = await http.get(Uri.parse(url));
            if (response.statusCode == 200) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$title intensity activated')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to communicate with device'),
                ),
              );
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error communicating with device')),
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
