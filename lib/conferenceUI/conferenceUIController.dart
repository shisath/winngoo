import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../common_file/functions.dart';
import 'model/categories.dart';

class ConferenceController extends GetxController {
  TextEditingController userId = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController conferenceId = TextEditingController();
  var loader = false.obs;
  late VideoPlayerController videoPlayerController;
  var isPlaying = false.obs;
  var isInitialized = false.obs;
  var videoCategoryApi = <videoCategory>[].obs;
  var url = ''.obs;

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

  @override
  void onInit() {
    super.onInit();
    // Initialize the video player controller
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://winngoogala.winngooconsultancy.in/celebrate/videos/Winngoo%20Gala%20keith%20Birthday/Winngoo%20Gala%20keith%20Birth.mp4'),
    )..initialize().then((_) {
        videoPlayerController.play(); // Refresh UI after initialization

        isInitialized.value = true;
        update();
      });
  }

  void togglePlayPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      isPlaying.value = false;
    } else {
      videoPlayerController.play();
      isPlaying.value = true;
    }
    update();
  }

  //
  // @override
  // void onClose() {
  //   videoPlayerController.dispose(); // Dispose the controller when not needed
  //   super.onClose();
  // }

  videoGetMethod() async {
    print('api res enter');

    var res = await getMethod(
        endPoint: 'categories/1/videos',
        setLoader: (l) {
          loader.value = l;
        },
        success: (s) {
          if (s == true) {
            print('pricing Api');
          }
        });
    if (res.toString().isNotEmpty) {
      print('summary event api res ${res}');

      videoCategoryApi.value = videoCategoryData(res);

      print('api res for video ${videoCategoryApi.value}');

      url.value = videoCategoryApi[0].url.toString();
      print('api res for video ${url.value}');

      print('api res for video'
          '${url.value}');
    }
  }
}
