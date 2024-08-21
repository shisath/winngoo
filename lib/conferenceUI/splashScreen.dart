// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// import 'call_page.dart';
// import 'homePage.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       backgroundColor: Colors.transparent,
//       // pageTransitionType: PageTransitionType.bottomToTopPop,
//       nextRoute: "/callPage",
//       curve: Curves.easeIn,
//       animationDuration: const Duration(seconds: 5),
//       splash: Stack(
//         children: [
//           Center(
//             child: LottieBuilder.asset(
//               "asset/lottie/cakesplash.json",
//               // backgroundLoading: false,
//             ),
//           ),
//           Center(
//             child: LottieBuilder.asset(
//               "asset/lottie/flower2.json",
//               // backgroundLoading: false,
//             ),
//           )
//         ],
//       ),
//     //   nextScreen: VideoConferencePage(
//     //   conferenceID: controller.conferenceId.text,
//     //   userId: controller.userId.text,
//     //   userName: controller.userName.text,
//     // ),
//       centered: true,
//       splashIconSize: 500,
//       splashTransition: SplashTransition.fadeTransition,
//       duration: 3800,
//     );
//   }
// }
