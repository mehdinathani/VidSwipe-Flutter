import 'package:flutter/material.dart';
import 'package:storyteller/reels_viewer.dart';
import 'package:storyteller/story_viewer.dart';
import 'package:storyteller/custom_product_viewer.dart'; // 1. IMPORT YOUR NEW SCREEN

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[50],
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.9,
          children: [
            // Card for "Reels Viewer"
            _FeatureCard(
              title: 'Reels Viewer',
              subtitle: 'Swipe vertically for endless fun!',
              icon: Icons.video_collection_rounded,
              gradient: const LinearGradient(
                colors: [Color(0xFF642B73), Color(0xFFC6426E)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InstaStyle()),
                );
              },
            ),
            // Card for "Story Viewer"
            _FeatureCard(
              title: 'Story Viewer',
              subtitle: 'Tap through engaging stories.',
              icon: Icons.auto_stories_rounded,
              gradient: const LinearGradient(
                colors: [Color(0xFF005AA7), Color(0xFFFFFDE4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoryViewer()),
                );
              },
            ),
            // 2. ADD THE NEW CARD FOR YOUR CUSTOM VIEWER
            _FeatureCard(
              title: 'Product Showcase',
              subtitle: 'Custom image-based viewer.',
              icon: Icons.shopping_bag_rounded,
              gradient: const LinearGradient(
                colors: [Color(0xFF16A085), Color(0xFFF4D03F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomProductViewer(),
                  ),
                );
              },
            ),
            // 3. (Optional) Add a placeholder to complete the grid
            _FeatureCard(
              title: 'Coming Soon',
              subtitle: 'More exciting features on the way!',
              icon: Icons.add_circle_outline_rounded,
              gradient: LinearGradient(
                colors: [Colors.grey[800]!, Colors.grey[600]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap: () {
                // You can add a snackbar or do nothing on tap
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Stay tuned for updates!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// A reusable widget for the feature cards on the home page.
class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 48, color: Colors.white),
                const Spacer(),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
