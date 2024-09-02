import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/conferenceUI/vedioConferenceScreen.dart';

import '../common_file/functions.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final String? userId = localStorage.read('userId');

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

    return Obx(
      () => AnimatedSplashScreen(
        backgroundColor: Colors.white,
        // pageTransitionType: PageTransitionType.bottomToTopPop,
        nextRoute: "/conference",
        // curve: Curves.easeIn,
        animationDuration: const Duration(seconds: 30),
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
          userId: userId.toString(),
          userName: logInController.membersApiData.value.data![0].firstName
              .toString(),
        ),
        centered: true,
        splashIconSize: 500,
        splashTransition: SplashTransition.decoratedBoxTransition,
        duration: 3000,
      ),
    );
  }
}
