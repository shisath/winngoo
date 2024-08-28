import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/conferenceUI/vedioConferenceScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve parameters from Get.arguments
    final isCakeMode = Get.arguments['isCakeMode'] ?? false;
    final isBabyShowering = Get.arguments['isBabyShowering'] ?? false;
    final isInaug = Get.arguments['isInaug'] ?? false;
    final isWedding = Get.arguments['isWedding'] ?? false;

    String lottieAssetPath;

    if (isCakeMode) {
      lottieAssetPath = "assets/lottie/cake.json";
    } else if (isBabyShowering) {
      lottieAssetPath = "assets/lottie/babyShowerin.json";
    } else if (isInaug) {
      lottieAssetPath = "assets/lottie/ribbon1.json";
    } else if (isWedding) {
      lottieAssetPath = "assets/lottie/ribbon2.json";
    } else {
      lottieAssetPath = "assets/lottie/flower2.json";
    }

    return AnimatedSplashScreen(
      backgroundColor: Colors.transparent,
      // pageTransitionType: PageTransitionType.bottomToTopPop,
      nextRoute: "/conference",
      // curve: Curves.easeIn,
      animationDuration: const Duration(seconds: 3),
      splash: Stack(
        children: [
          Center(
            child: LottieBuilder.asset(lottieAssetPath
                // backgroundLoading: false,
                ),
          ),
          // Center(
          //   child: LottieBuilder.asset(
          //     "assets/lottie/flower2.json",
          //     // backgroundLoading: false,
          //   ),
          // )
        ],
      ),
      nextScreen: VideoConferencePage(
        conferenceID: joinMeetingController.enterCode.text,
        userId: joinMeetingController.enterCode.text,
        userName: joinMeetingController.enterCode.text,
      ),
      centered: true,
      splashIconSize: 500,
      splashTransition: SplashTransition.fadeTransition,
      duration: 20,
    );
  }
}
