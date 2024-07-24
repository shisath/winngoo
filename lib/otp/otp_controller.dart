import 'dart:async';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var countdown = 30.obs; // Observable variable

  Timer? _timer;
  @override
  void onInit() {
    super.onInit();
    // startTimer();
  }

  void startTimer() {
    countdown.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        _timer!.cancel();
        countdown.value = 30;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
