import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TrevaPage extends StatefulWidget {
  const TrevaPage({super.key});

  @override
  State<TrevaPage> createState() => _TrevaPageState();
}

class _TrevaPageState extends State<TrevaPage> {
  final TextEditingController _controller = TextEditingController();
  String _answer = '';
  List<String> _aromaImages = [];

  Future<void> _handleQuestion(String question) async {
    setState(() {
      _answer = "Thinking...";
      _aromaImages = [];
    });

    // Custom answer for "what is triease"
    if (question.toLowerCase().contains('what is triease')) {
      setState(() {
        _answer =
            "TriEase is a smart wearable massaging band designed to help relieve stress and pain in the wrist, head, and leg — common problem areas for IT professionals. Controlled via a mobile app, it offers customizable vibration modes, immersive relaxation and luxury features like mini games, music and stories, and a comfortable, portable design. TriEase aims to bring convenient, tech-driven wellness into everyday routines.";
        _aromaImages = [];
      });
      return;
    }

    final url = Uri.parse('https://api.adviceslip.com/advice');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String advice = data['slip']['advice'];

        List<String> aromas = [];
        if (question.toLowerCase().contains('pain')) {
          aromas = ['assets/aromas/map1.png', 'assets/aromas/map2.png'];
        } else if (question.toLowerCase().contains('relax')) {
          aromas = ['assets/aromas/map3.png', 'assets/aromas/map4.png'];
        } else if (question.toLowerCase().contains('energy')) {
          aromas = ['assets/aromas/map5.png', 'assets/aromas/map6.png'];
        }

        setState(() {
          _answer = advice;
          _aromaImages = aromas;
        });
      } else {
        setState(() {
          _answer = "Sorry, couldn't get advice right now.";
          _aromaImages = [];
        });
      }
    } catch (e) {
      setState(() {
        _answer = "Error: $e";
        _aromaImages = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treva AI Bot'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Ask Treva about our products or get aroma recommendations!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type your question...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      _handleQuestion(_controller.text.trim());
                    }
                  },
                ),
              ),
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  _handleQuestion(value.trim());
                }
              },
            ),
            const SizedBox(height: 24),
            if (_answer.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(_answer, style: const TextStyle(fontSize: 16)),
              ),
            if (_aromaImages.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _aromaImages.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      return Image.asset(
                        _aromaImages[index],
                        width: 70,
                        height: 70,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
