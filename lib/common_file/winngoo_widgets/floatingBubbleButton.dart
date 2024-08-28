import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';

class DraggableBubbleScreen extends StatefulWidget {
  @override
  _DraggableBubbleScreenState createState() => _DraggableBubbleScreenState();
}

class _DraggableBubbleScreenState extends State<DraggableBubbleScreen> {
  Offset _position = Offset(100, 100); // Initial position of the bubble
  bool _showIcons = false; // Control whether to show icons or not

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _position.dx,
          top: _position.dy,
          child: Draggable(
            feedback:
                _buildBubble(), // The floating bubble appearance while dragging
            childWhenDragging:
                Container(), // Empty when the bubble is being dragged
            onDragEnd: (details) {
              setState(() {
                // Update the position after the drag ends
                _position = details.offset;
              });
            },
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _showIcons = !_showIcons; // Toggle icon visibility on tap
                });
              },
              child: _buildBubble(),
            ),
          ),
        ),
        if (_showIcons)
          Positioned(
            left: _position.dx, // Adjust icon position relative to bubble
            top: _position.dy + 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textDecoreButton(
                    onPress: () {
                      _showIcons = !_showIcons;
                      // Your button action here
                      Get.toNamed('/splash', arguments: {
                        'isCakeMode': true,
                        'isBabyShowering': false,
                        'isInaug': false,
                        'isWedding': false,
                      });
                    },
                    text: 'BIRTHDAY CELEB'),
                textDecoreButton(
                    onPress: () {
                      Get.toNamed('/splash', arguments: {
                        'isCakeMode': true,
                        'isBabyShowering': false,
                        'isInaug': false,
                        'isWedding': false,
                      });
                    },
                    text: 'WEDDING CELEB'),
                textDecoreButton(
                    onPress: () {
                      Get.toNamed('/splash', arguments: {
                        'isCakeMode': false,
                        'isBabyShowering': true,
                        'isInaug': false,
                        'isWedding': false,
                      });
                    },
                    text: 'BABY SHOWERING'),
                textDecoreButton(
                    onPress: () {
                      Get.toNamed('/splash', arguments: {
                        'isCakeMode': false,
                        'isBabyShowering': false,
                        'isInaug': true,
                        'isWedding': false,
                      });
                    },
                    text: 'INAUGRATION'),

                // Add more icons as needed
              ],
            ),
          ),
      ],
    );
  }

  // Create a bubble-like appearance
  Widget _buildBubble() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Colors.pinkAccent,
            Colors.deepPurpleAccent
          ], // Radial gradient for a festive look
          stops: [0.3, 1.0],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 3.0,
        ), // White border for a refined touch
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 3,
            offset: Offset(5, 5), // Slight offset for a 3D effect
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(-3, -3), // Additional shadow for more depth
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.celebration,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}

Widget textDecoreButton(
    {required void Function()? onPress, required String text}) {
  return TextButton(
    onPressed: onPress,
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0), // Smooth rounded edges
      ),

      backgroundColor:
          Colors.transparent, // Background will be managed by the gradient
    ),
    child: Ink(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purpleAccent, Colors.deepPurple], // Gradient effect
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.6), width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: contentSize,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black26,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
