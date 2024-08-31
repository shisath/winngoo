import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/getXcontroller.dart';

class OtpController extends GetxController {
  TextEditingController verificationCode = TextEditingController();
  var countdown = 30.obs; // Observable variable
  RxBool loader = false.obs;
  Timer? _timer;

  // @override
  // void onInit() {
  //   super.onInit();
  //   // startTimer();
  // }

  void startTimer() {
    countdown.value = 60;
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

  otpVerification() async {
    final String? token = localStorage.read('api_token');

    var res = await postMethod(
        endPoint: "verify-code",
        body: {
          "email": forgotPasswordController.mailController.text,
          "code": verificationCode.text,
        },
        token: "",
        setLoader: (s) {},
        success: (s) {
          if (s == true) {
            Get.toNamed("/enterNewPassword");
          }
        });
    // if (res.toString().isNotEmpty) {}
  }
}
