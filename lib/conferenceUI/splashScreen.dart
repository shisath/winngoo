import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/conferenceUI/vedioConferenceScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.transparent,
      // pageTransitionType: PageTransitionType.bottomToTopPop,
      nextRoute: "/callPage",
      curve: Curves.easeIn,
      animationDuration: const Duration(seconds: 5),
      splash: Stack(
        children: [
          Center(
            child: LottieBuilder.asset(
              "asset/lottie/cakesplash.json",
              // backgroundLoading: false,
            ),
          ),
          Center(
            child: LottieBuilder.asset(
              "asset/lottie/flower2.json",
              // backgroundLoading: false,
            ),
          )
        ],
      ),
      nextScreen: VideoConferencePage(
        conferenceID:
            logInController.membersApiData.value.data![0].userId.toString(),
        userId: conferenceController.userId.text,
        userName: conferenceController.userName.text,
      ),
      centered: true,
      splashIconSize: 500,
      splashTransition: SplashTransition.fadeTransition,
      duration: 3800,
    );
  }
}
