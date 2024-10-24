import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class CustomFlickControls extends StatelessWidget {
  final FlickManager flickManager;

  const CustomFlickControls({Key? key, required this.flickManager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlickVideoWithControls(
      controls: Container(
        color: Colors.transparent,
        // Make it transparent if you don't need controls
        child: Column(
          children: [
            Expanded(
              child: FlickAutoHideChild(
                child: GestureDetector(
                  onTap: () {
                    // Handle tap if you need any action on the video
                  },
                ),
              ),
            ),
            // No play button and no video duration here
          ],
        ),
      ),
    );
  }
}
