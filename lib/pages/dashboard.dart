// Importing Material Design package from Flutter which contains UI components like Scaffold, AppBar, Column, Row, Text, Container, etc.
import 'package:flutter/material.dart';

// Dashboard is defined as a StatefulWidget.
// A StatefulWidget is used when the screen's UI might change dynamically (e.g., loading data from an API, updating lists, etc.).
class Dashboard extends StatefulWidget {
  // Constructor for Dashboard widget with optional Key parameter
  const Dashboard({super.key});

  // createState creates the mutable state object (_DashboardState) associated with this StatefulWidget
  @override
  State<Dashboard> createState() => _DashboardState();
}

// _DashboardState holds the state and UI build logic for the Dashboard widget
class _DashboardState extends State<Dashboard> {
  
  // =========================================================================
  // REUSABLE HELPER METHOD: horizontallistcard
  // Creates a styled news card widget for the top horizontal scrollable list.
  // Parameters:
  // - size: MediaQuery Size object to calculate responsive width and height
  // - stringTitle: Title text displayed on top of the card
  // - url: Image network URL for the background image
  // - date: Publication date text displayed at the bottom left
  // =========================================================================
  Widget horizontallistcard(Size size, String stringTitle, String url, String date) {
    // Stack allows us to overlay widgets on top of each other (e.g. text over an image)
    return Stack(
      children: [
        // 1. BACKGROUND CONTAINER WITH NETWORK IMAGE
        Container(
          margin: const EdgeInsets.all(15), // Margin around the entire card (15 pixels on all sides)
          height: size.height / 4.5,        // Responsive height: ~22% of total screen height
          width: size.width / 1.2,          // Responsive width: ~83% of total screen width
          decoration: BoxDecoration(
            color: Colors.black,            // Background fallback color
            borderRadius: BorderRadius.circular(30), // Rounded corners with 30px radius
          ),
          // ClipRRect clips the child image so it respects the rounded border radius of 30px
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              url,             // Loads the image from the given URL string
              fit: BoxFit.cover, // Scales the image to fill the container without distortion
            ),
          ),
        ),

        // 2. ARTICLE TITLE TEXT OVERLAY
        Positioned(
          bottom: 45, // Distance from bottom edge of Stack
          left: 30,   // Distance from left edge of Stack
          child: SizedBox(
            width: size.width / 2, // Limits text width to half the screen width to avoid overflow
            child: Text(
              stringTitle, // News title string passed as parameter
              style: const TextStyle(color: Colors.white, fontSize: 16), // White text, 16pt font
              maxLines: 2, // Restricts title to a maximum of 2 lines
              overflow: TextOverflow.ellipsis, // Adds '...' if text is longer than 2 lines
            ),
          ),
        ),

        // 3. DATE TEXT OVERLAY
        Positioned(
          bottom: 25, // Distance from bottom edge of Stack
          left: 30,   // Distance from left edge of Stack
          child: SizedBox(
            width: size.width / 2, // Limits date text container width
            child: Text(
              date, // Date string passed as parameter
              style: const TextStyle(color: Colors.white, fontSize: 16), // White text, 16pt font
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),

        // 4. PLAY BUTTON ICON OVERLAY
        const Positioned(
          bottom: 25, // Distance from bottom edge
          right: 30,  // Distance from right edge
          child: Icon(
            Icons.play_circle_fill, // Circular play button icon
            color: Colors.white,    // White icon color
            size: 40,               // Icon size of 40 pixels
          ),
        )
      ],
    );
  }

  // =========================================================================
  // BUILD METHOD
  // Describes the part of the user interface represented by this widget.
  // =========================================================================
  @override
  Widget build(BuildContext context) {
    // Obtain screen dimensions (width and height) of the current device
    var size = MediaQuery.of(context).size;

    // Sample image URL used for demo news cards
    const sampleImageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgqeajuv9yQk9RwjhDUmufRCzP9wc7hra4S8EBeFOB6w&s=10";

    // Scaffold provides the standard visual layout structure for a material design screen
    return Scaffold(
      // Top Navigation Bar (AppBar)
      appBar: AppBar(
        title: const Text(
          "eWS", // App title text
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue), // Bold blue text
        ),
        centerTitle: true, // Centers the title in the AppBar
      ),

      // Main body layout using Column
      body: Column(
        children: [
          // =========================================================================
          // TOP SECTION: HORIZONTAL SCROLLABLE FEATURED NEWS
          // This section is fixed at the top (sticky) and scrolls horizontally.
          // =========================================================================
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Sets scroll direction to horizontal
            child: Row(
              children: [
                // Call reusable function horizontallistcard to render news cards
                horizontallistcard(
                  size,
                  "Hello PCPS news channel Happy dashain Hello PCPS news channel Happy dashain",
                  sampleImageUrl,
                  "02 Feb 2026",
                ),
                horizontallistcard(
                  size,
                  "Hello PCPS news channel Happy dashain Hello PCPS news channel Happy dashain",
                  sampleImageUrl,
                  "02 Feb 2026",
                ),
                horizontallistcard(
                  size,
                  "Hello PCPS news channel Happy dashain Hello PCPS news channel Happy dashain",
                  sampleImageUrl,
                  "02 Feb 2026",
                ),
              ],
            ),
          ),

          // Spacing box between top horizontal section and bottom vertical list
          const SizedBox(height: 10),

          // =========================================================================
          // BOTTOM SECTION: VERTICAL SCROLLABLE NEWS LIST
          // Expanded fills all remaining vertical screen space.
          // SingleChildScrollView enables vertical scrolling for the bottom list items.
          // =========================================================================
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Individual vertical news list items using _buildVerticalListItem
                  _buildVerticalListItem(
                    "Recently, there were many pieces about how the new...",
                    "Forbes.com",
                    "May 24, 2020",
                  ),
                  _buildVerticalListItem(
                    "Opinions expressed by Entrepreneur contributor...",
                    "Entrepreneur",
                    "May 24, 2020",
                  ),
                  _buildVerticalListItem(
                    "We, as a society, are now experiencing a crisis of...",
                    "Cointelegra...",
                    "May 24, 2020",
                  ),
                  _buildVerticalListItem(
                    "Jacob from XenSpec is back with another...",
                    "Lowendbox...",
                    "May 24, 2020",
                  ),
                  _buildVerticalListItem(
                    "Allen Farrington writes at Quillette, Areo and Merio...",
                    "Coindesk.co...",
                    "May 24, 2020",
                  ),
                  _buildVerticalListItem(
                    "Allen Farrington writes at Quillette, Areo and Merio...",
                    "Coindesk.co...",
                    "May 24, 2020",
                  ),
                  // Extra padding at the bottom of the scroll view
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // REUSABLE HELPER METHOD: _buildVerticalListItem
  // Creates a single news item row for the bottom vertical list view.
  // Parameters:
  // - title: Article summary or title string
  // - source: Publisher or news source badge text (e.g. Forbes.com)
  // - date: Publication date string
  // =========================================================================
  Widget _buildVerticalListItem(String title, String source, String date) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8), // Margin around each list row
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns items to top edge of row
        children: [
          // LEFT SIDE: THUMBNAIL IMAGE WITH OVERLAY PLAY ICON
          Stack(
            alignment: Alignment.center, // Centers play icon inside stack
            children: [
              // Rounded thumbnail image
              ClipRRect(
                borderRadius: BorderRadius.circular(15), // 15px rounded corner radius
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgqeajuv9yQk9RwjhDUmufRCzP9wc7hra4S8EBeFOB6w&s=10",
                  height: 90,  // Fixed height of 90 pixels
                  width: 120,  // Fixed width of 120 pixels
                  fit: BoxFit.cover, // Fills thumbnail box evenly
                ),
              ),
              // Play icon overlay over thumbnail
              const Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 35, // 35px play icon size
              ),
            ],
          ),

          // Spacing between thumbnail image and text column
          const SizedBox(width: 15),

          // RIGHT SIDE: TEXT DETAILS (Title, Source Badge, Date)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Left-aligns column text
              children: [
                // Article title text
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500), // 14pt medium-bold text
                  maxLines: 2, // Maximum 2 lines
                  overflow: TextOverflow.ellipsis, // Truncates with '...' if text overflows
                ),

                const SizedBox(height: 8), // Vertical spacing between title and bottom badge row

                // Bottom row with red publisher badge and date text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes badge to left and date to right
                  children: [
                    // Red Source Publisher Badge (e.g., Forbes.com)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), // Padding inside badge
                      decoration: BoxDecoration(
                        color: Colors.red, // Red background color for badge
                        borderRadius: BorderRadius.circular(6), // 6px rounded corners
                      ),
                      child: Text(
                        source, // Publisher name string
                        style: const TextStyle(
                          color: Colors.white, 
                          fontSize: 12, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Publication date text
                    Text(
                      date, // Date string
                      style: const TextStyle(color: Colors.black, fontSize: 12), // 12pt black text
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
