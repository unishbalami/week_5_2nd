import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Dashboard is a StatefulWidget because its state might change in the future (e.g., loading new data).
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // Get device screen size (height and width) to make UI responsive
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // Top app bar with custom title "eWS"
      appBar: AppBar(
        title: const Text(
          "eWS",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        centerTitle: true,
      ),
      // Outer SingleChildScrollView makes the entire dashboard scrollable vertically
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ==========================================
            // TOP HORIZONTAL SCROLLABLE CONTAINER
            // ==========================================
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enables horizontal scrolling
              child: Row(
                children: [
                  // Multiple horizontal news cards (reusing our helper method)
                  _buildNewsCard(size),
                  _buildNewsCard(size),
                  _buildNewsCard(size),
                ],
              ),
            ),
            const SizedBox(height: 10), // Spacing between sections

            // ==========================================
            // BOTTOM VERTICAL NEWS LIST ITEMS
            // ==========================================
            _buildVerticalListItem(
              size,
              "Recently, there were many pieces about how the new...",
              "Forbes.com",
              "May 24, 2020",
            ),
            _buildVerticalListItem(
              size,
              "Opinions expressed by Entrepreneur contributor...",
              "Entrepreneur",
              "May 24, 2020",
            ),
            _buildVerticalListItem(
              size,
              "We, as a society, are now experiencing a crisis of...",
              "Cointelegra...",
              "May 24, 2020",
            ),
            _buildVerticalListItem(
              size,
              "Jacob from XenSpec is back with another...",
              "Lowendbox...",
              "May 24, 2020",
            ),
            _buildVerticalListItem(
              size,
              "Allen Farrington writes at Quillette, Areo and Merio...",
              "Coindesk.co...",
              "May 24, 2020",
            ),
            const SizedBox(height: 20), // Bottom padding for smooth scrolling
          ],
        ),
      ),
    );
  }

  /// Helper method to build a featured top news card (used inside horizontal scroll view)
  Widget _buildNewsCard(Size size) {
    return Stack(
      children: [
        // Background container with rounded corners and image
        Container(
          margin: const EdgeInsets.all(15),
          height: size.height / 4.5, // Responsive height based on screen size
          width: size.width / 1.2,   // Responsive width based on screen size
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30), // Rounded corners for card
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30), // Clips image to match container border radius
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgqeajuv9yQk9RwjhDUmufRCzP9wc7hra4S8EBeFOB6w&s=10",
              fit: BoxFit.cover, // Covers the container area nicely
            ),
          ),
        ),
        // Title text positioned over the card
        Positioned(
          bottom: 45,
          left: 30,
          child: SizedBox(
            width: size.width / 2,
            child: const Text(
              "Hello PCPS news channel Happy dashain Hello PCPS news channel Happy dashain",
              style: TextStyle(color: Colors.white, fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        // Date text positioned at bottom left
        Positioned(
          bottom: 25,
          left: 30,
          child: SizedBox(
            width: size.width / 2,
            child: const Text(
              "02 Feb 2026",
              style: TextStyle(color: Colors.white, fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        // Play icon button positioned at bottom right
        const Positioned(
          bottom: 25,
          right: 30,
          child: Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 40,
          ),
        )
      ],
    );
  }

  /// Helper method to build each item in the bottom vertical news list
  Widget _buildVerticalListItem(Size size, String title, String source, String date) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side: Thumbnail image with play icon overlay using a Stack
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgqeajuv9yQk9RwjhDUmufRCzP9wc7hra4S8EBeFOB6w&s=10",
                  height: 90,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 35,
              ),
            ],
          ),
          const SizedBox(width: 15), // Spacing between image and text details
          // Right side: Title, source badge, and date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Article title text
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Bottom row inside the item with source badge (red box) and date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Source badge (e.g., Forbes.com)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        source,
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Publication date
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
