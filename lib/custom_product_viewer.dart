import 'package:flutter/material.dart';
import 'dart:math'; // Needed for the star rating logic

// 1. A MUCH MORE DETAILED DATA MODEL
class ProductModel {
  final String imageUrl;
  final String productName;
  final String sellerName;
  final String brandLogoUrl;
  final String price;
  final double rating;
  final int ratingCount;
  final int reviewCount;
  bool isWatched;
  bool isOfficialStore;

  ProductModel({
    required this.imageUrl,
    required this.productName,
    required this.sellerName,
    required this.brandLogoUrl,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.reviewCount,
    this.isWatched = false,
    this.isOfficialStore = false,
  });
}

class CustomProductViewer extends StatelessWidget {
  CustomProductViewer({super.key});

  final List<ProductModel> products = [
    ProductModel(
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      productName: 'Vibrant Red Runner',
      sellerName: 'Nike Flagship Store',
      brandLogoUrl:
          'https://i.pinimg.com/originals/de/a4/c9/dea4c9353599e15f67aa814f33148443.png',
      price: '\$160.00',
      rating: 4.8,
      ratingCount: 18270,
      reviewCount: 4567,
      isWatched: true,
      isOfficialStore: true,
    ),
    ProductModel(
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
      productName: 'Classic Chronograph Watch',
      sellerName: 'Timeless Watches Co.',
      brandLogoUrl:
          'https://i.pinimg.com/originals/c1/9f/12/c19f12e4f526b38c2278792036495689.png',
      price: '\$250.00',
      rating: 4.6,
      ratingCount: 25340,
      reviewCount: 8123,
    ),
    ProductModel(
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
      productName: 'Pro Audio Headphones',
      sellerName: 'SoundWave Audio',
      brandLogoUrl:
          'https://cdn.dribbble.com/users/423687/screenshots/14299824/media/649d2906511a768c7e873a0a1945653d.png?compress=1&resize=400x300',
      price: '\$199.00',
      rating: 4.9,
      ratingCount: 45890,
      reviewCount: 11234,
      isWatched: true,
    ),
  ];

  final PageController _controller = PageController(initialPage: 5000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final productIndex = index % products.length;
          return ProductPage(product: products[productIndex]);
        },
      ),
    );
  }
}

class ProductPage extends StatefulWidget {
  final ProductModel product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late bool _isWatched;

  @override
  void initState() {
    super.initState();
    _isWatched = widget.product.isWatched;
  }

  void _toggleWatch() {
    setState(() {
      _isWatched = !_isWatched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image
        Image.network(
          widget.product.imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        ),

        // 2. A NEW, DETAILED UI OVERLAY
        _buildUiOverlay(),
      ],
    );
  }

  Widget _buildUiOverlay() {
    return Column(
      children: [
        // TOP SELLER BAR
        _buildTopBar(),
        const Spacer(),
        // MAIN CONTENT (BOTTOM INFO + SIDE ACTIONS)
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // BOTTOM INFO PANEL
            Expanded(child: _buildBottomInfoPanel()),
            // SIDE ACTION BUTTONS
            _buildSideActionButtons(),
          ],
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
      color: Colors.black.withOpacity(0.3),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.product.brandLogoUrl),
            radius: 20,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.sellerName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.product.isOfficialStore)
                const Text(
                  'Official Store',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
            ],
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: const Text('Follow'),
          ),
        ],
      ),
    );
  }

  Widget _buildSideActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
        bottom: 80,
      ), // Adjusted padding
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ActionButton(
            icon: _isWatched ? Icons.bookmark : Icons.bookmark_border,
            label: 'Watch',
            onTap: _toggleWatch,
            iconColor: _isWatched ? Colors.yellowAccent : Colors.white,
          ),
          const SizedBox(height: 25),
          _ActionButton(
            icon: Icons.reviews_outlined,
            label: widget.product.reviewCount.toString(),
            onTap: () {
              // In a real app, this would open a reviews bottom sheet
            },
          ),
          const SizedBox(height: 25),
          _ActionButton(icon: Icons.share, label: 'Share', onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildBottomInfoPanel() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      // Gradient for text readability
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.productName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                widget.product.rating.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              _buildStarRating(widget.product.rating),
              const SizedBox(width: 8),
              Text(
                '(${widget.product.ratingCount} Ratings)',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.product.price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${widget.product.productName} added to cart!',
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                  0xFFF57224,
                ), // Daraz/AliExpress Orange
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // A helper function to build the star icons dynamically
  Widget _buildStarRating(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      IconData icon;
      if (i <= rating) {
        icon = Icons.star_rounded; // Full star
      } else if (i > rating && i < rating + 1) {
        icon = Icons.star_half_rounded; // Half star
      } else {
        icon = Icons.star_outline_rounded; // Empty star
      }
      stars.add(Icon(icon, color: Colors.amber, size: 18));
    }
    return Row(children: stars);
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color iconColor;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32, color: iconColor),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
