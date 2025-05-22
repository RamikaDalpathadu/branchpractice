import 'package:flutter/material.dart';
import 'package:triease_app/pages/StoryPage.dart';
import 'package:triease_app/pages/controller_page.dart';
import 'package:triease_app/pages/game_interface.dart';
import 'package:triease_app/pages/music_interface.dart';
import 'package:triease_app/pages/serenity.dart';
import 'package:triease_app/pages/trevabot.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _blinkController;
  late Animation<double> _blinkAnimation;
  final TextEditingController _searchController =
      TextEditingController(); // Add this

  @override
  void initState() {
    super.initState();
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat(reverse: true);

    _blinkAnimation = Tween<double>(
      begin: 1.0,
      end: 0.5,
    ).animate(_blinkController);
  }

  @override
  void dispose() {
    _blinkController.dispose();
    _searchController.dispose(); // Dispose controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content of the page
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255), // Start color
                Color.fromARGB(255, 128, 209, 196), // End color
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SizedBox(
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Typable Search Bar
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            isDense: true,
                          ),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(
                            context,
                          ).unfocus(); // This will stop the cursor (remove focus)
                        },
                        child: Icon(Icons.search, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Center(
                    child: Text(
                      'TriEase | 3 in 1 Muscle Reliever | Relief On The GO',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Recently Used',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MusicPage(),
                            ),
                          );
                        },
                        child: _buildSquareItem('Music'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StoryPage(),
                            ),
                          );
                        },
                        child: _buildSquareItem('Relax Stories'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ControllerPage(),
                            ),
                          );
                        },
                        child: _buildSquareItem('Controller'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImmersiveSerenityPage(),
                            ),
                          );
                        },
                        child: _buildSquareItem('Serenity'),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    'Explore Your Interests 🪷🪷🪷',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      _buildVerticalItem(context, 'Controller', Icons.gamepad),
                      _buildVerticalItem(
                        context,
                        'Immersive Serenity',
                        Icons.spa,
                      ),
                      _buildVerticalItem(context, 'Music', Icons.music_note),
                      _buildVerticalItem(
                        context,
                        'Games',
                        Icons.videogame_asset,
                      ),
                      _buildVerticalItem(context, 'Treva AI Bot', Icons.map),
                      _buildVerticalItem(
                        context,
                        'Relaxing Stories',
                        Icons.book,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Add the bot at the bottom-right corner
        Positioned(
          bottom: 60, // Distance from the bottom
          right: 20, // Distance from the right
          child: ScaleTransition(
            scale: _blinkAnimation,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 5, 90, 76),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Icon(Icons.support_agent, color: Colors.white, size: 40),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSquareItem(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 24, 172, 147), // Teal color
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5), // Shadow below the button
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalItem(
    BuildContext context,
    String title,
    IconData? icon,
  ) {
    return GestureDetector(
      onTap: () {
        if (title == 'Controller') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ControllerPage()),
          );
        }
        if (title.trim() == 'Immersive Serenity') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ImmersiveSerenityPage(),
            ),
          );
        }

        if (title.trim() == 'Music') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MusicPage()),
          );
        }
        if (title.trim() == 'Relaxing Stories') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StoryPage()),
          );
        }
        if (title.trim() == 'Treva AI Bot') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TrevaPage()),
          );
        }
        if (title.trim() == 'Games') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GamingInterface()),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10),
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 59, 161, 144), // Teal color
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5), // Shadow below the button
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 30),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
