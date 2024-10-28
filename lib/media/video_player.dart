// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:video_player/video_player.dart';
// //
// // import '../common_file/getXcontroller.dart';
// //
// // class VideoPlayerScreen extends StatelessWidget {
// //   const VideoPlayerScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Initialize the video player when the screen opens
// //     conferenceController.playVideo(
// //         "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
// //
// //     return Scaffold(
// //       body: Center(
// //         child: Obx(() {
// //           final controller = conferenceController.videoPlayerController.value;
// //
// //           // Check if the video controller is initialized
// //           if (!controller.value.isInitialized) {
// //             return const CircularProgressIndicator(); // Show loader until the video is ready
// //           }
// //
// //           // Video is initialized, display it
// //           return AspectRatio(
// //             aspectRatio: controller.value.aspectRatio,
// //             child: VideoPlayer(controller),
// //           );
// //         }),
// //       ),
// //       floatingActionButton: Obx(() {
// //         final controller = conferenceController.videoPlayerController.value;
// //
// //         if (!controller.value.isInitialized) {
// //           return const SizedBox
// //               .shrink(); // Do not show button until the video is ready
// //         }
// //
// //         return FloatingActionButton(
// //           onPressed: () {
// //             // Toggle video play/pause
// //             if (controller.value.isPlaying) {
// //               controller.pause();
// //             } else {
// //               controller.play();
// //             }
// //           },
// //           child: Icon(
// //             controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
// //           ),
// //         );
// //       }),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
//
// import '../conferenceUI/conferenceUIController.dart';
//
// class VideoPlayerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Video Player'),
//       // ),
//       body: Center(
//         child: GetBuilder<ConferenceController>(
//           builder: (controller) {
//             if (!controller.isInitialized.value) {
//               return CircularProgressIndicator(); // Show a loader while the video is initializing
//             }
//             return Stack(
//               children: [
//                 SizedBox(
//                     height: MediaQuery.sizeOf(context).height,
//                     child: VideoPlayer(controller.videoPlayerController)),
//                 Positioned(
//                   height: 1300,
//                   width: 370,
//                   child: SizedBox(
//                     height: 60,
//                     child: IconButton(
//                       icon: Icon(
//                         controller.isPlaying.value
//                             ? Icons.pause
//                             : Icons.play_arrow,
//                         size: 50,
//                       ),
//                       onPressed: () {
//                         controller.togglePlayPause(); // Play or pause the video
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
//
// class LocalVideoPlayer extends StatefulWidget {
//   @override
//   _LocalVideoPlayerState createState() => _LocalVideoPlayerState();
// }
//
// class _LocalVideoPlayerState extends State<LocalVideoPlayer> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the VideoPlayerController with the local video file
//     _controller = VideoPlayerController.asset('assets/birthDayVideo.mp4')
//       ..initialize().then((_) {
//         setState(() {}); // Update the UI after the video is initialized
//
//         _controller.addListener(() {
//           if (_controller.value.position == _controller.value.duration) {
//             // Video has completed
//             // Redirect to the home page
//             Get.offAllNamed('/conference'); // Replace with your home route
//           }
//         });
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller
//         .dispose(); // Clean up the controller when the widget is disposed
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Local Video Player'),
//       ),
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               )
//             : CircularProgressIndicator(), // Show a loading indicator while the video initializes
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             // Play or pause the video when the button is pressed
//             _controller.value.isPlaying
//                 ? _controller.pause()
//                 : _controller.play();
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:winggoo/common_file/getXcontroller.dart';

import 'customFlickController.dart';

class VideoPlayer extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late FlickManager flickManager;

  // 'https://winngoogala.winngooconsultancy.in/celebrate/birthday/Birthday  (3).mp4'

  @override
  void initState() {
    super.initState();

    print('video url ${mediaController.videoUrl.value}');
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(mediaController.videoUrl.value)),
    );

    flickManager.flickVideoManager!.videoPlayerController!.addListener(() {
      final videoPlayerController =
          flickManager.flickVideoManager!.videoPlayerController!;

      // Check if the video has finished playing
      if (videoPlayerController.value.position ==
          videoPlayerController.value.duration) {
        Get.back();
      }
    });
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlickVideoPlayer(
        flickManager: flickManager,
        flickVideoWithControls: CustomFlickControls(flickManager: flickManager),
      ),
    );
  }
}
