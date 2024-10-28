import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../common_file/functions.dart';
import '../conferenceUI/model/categories.dart';

class MediaController extends GetxController {
  var videoCategoryApi = <videoCategory>[].obs;
  var videoUrl = ''.obs;
  late VideoPlayerController videoPlayerController;
  var isInitialized = false.obs;
  var isPlaying = false.obs;

  RxBool loader = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //
  //   print('video url ${videoUrl.value}');
  //
  //   // Initialize the video player controller
  //   videoPlayerController = VideoPlayerController.networkUrl(
  //     Uri.parse(videoUrl.value),
  //   )..initialize().then((_) {
  //       videoPlayerController.play(); // Refresh UI after initialization
  //
  //       isInitialized.value = true;
  //       update();
  //     });
  // }

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

  videoGetMethod({required String category}) async {
    var res = await getMethod(
        endPoint: 'categories/$category/videos',
        setLoader: (l) {
          loader.value = l;
        },
        success: (s) {
          if (s == true) {
            Get.toNamed('/videoPlayer');
          }
        });
    if (res.toString().isNotEmpty) {
      print('summary event api res ${res}');

      videoCategoryApi.value = videoCategoryData(res);

      print('api res for video ${videoCategoryApi}');

      videoUrl.value = videoCategoryApi[0].url.toString();
      print('api res for video ${videoUrl.value}');

      print('api res for video'
          '${videoUrl.value}');

      futureDelay(Duration(milliseconds: 1000));

      Get.toNamed('/videoPlayer');
    }
  }
}
