import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ConferenceController extends GetxController {
  TextEditingController userId = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController conferenceId = TextEditingController();
  var loader = false.obs;

// @override
// void onInit() {
//   // TODO: implement onInit
//   super.onInit();
//
//   var videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
//           "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"))
//       .obs;
// }
//
// void playVideo(String videoUrl) {
//   videoPlayerController.value =
//       VideoPlayerController.networkUrl(Uri.parse(videoUrl));
//   videoPlayerController.value.initialize().then((_) {
//     update(); // Update UI when video is initialized
//   });
// }
// 'https://winngoogala.winngooconsultancy.in/celebrate/videos/Winngoo%20Gala%20keith%20Birthday/Winngoo%20Gala%20keith%20Birth.mp4'
//

//
// @override
// void onClose() {
//   videoPlayerController.dispose(); // Dispose the controller when not needed
//   super.onClose();
// }
}
