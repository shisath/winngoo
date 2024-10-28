import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:winggoo/choose_your_plane/choose_your_plane_screen.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/winngooSplashScreen.dart';

import '../JoinMeeting (enter your code)/join_meeting_screen.dart';
import '../LogIn/login_screen.dart';
import '../addEvent/addEvent_Screen.dart';
import '../conferenceUI/splashScreen.dart';
import '../conferenceUI/vedioConferenceScreen.dart';
import '../documents/aboutUs_screen.dart';
import '../documents/privacyPolicy_screen.dart';
import '../documents/terms&cond_screen.dart';
import '../enterNewPassword/enter_new_password_screen.dart';
import '../forgotPassword/forgot_password_screen.dart';
import '../home/home_screen.dart';
import '../media/video_player.dart';
import '../otp/otp_screen.dart';
import '../payment/payment_screen.dart';
import '../profile/profile_screen.dart';
import '../resetPassword/reset_password_screen.dart';
import '../shedule_date_time/shedule_date_time_Screen.dart';
import '../signup/signUp_screen.dart';
import '../summary/summary_screen.dart';
import '../thankYou/screen.dart';
import 'functions.dart';

final String? userId = localStorage.read('userId');
final String? token = localStorage.read('api_token');
final String? userName = localStorage.read('userName');
final routes = [
  GetPage(
      name: '/signIn',
      page: () => const LogInScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/signUp',
      page: () => const SignUpScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/otp',
      page: () => const OtpScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/resetPassword',
      page: () => const ResetPasswordScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/forgotPassword',
      page: () => const ForgotPasswordScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
    name: '/homeScreen',
    page: () => const HomeScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
      name: '/addEventScreen',
      page: () => const AddEventScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/sheduleScreen',
      page: () => const SheduleDateAndTimeScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/enterNewPassword',
      page: () => const EnterNewPasswordScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/chooseYourPlane',
      page: () => const ChooseYourPlaneScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/summary',
      page: () => const SummaryScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/payment',
      page: () => const PaymentScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/profile',
      page: () => const ProfileScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
    name: '/privacy',
    page: () => const AboutUsScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/privacyPolicy',
    page: () => const PrivacyPolicyScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/terms&cond',
    page: () => TermsAndConditionScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
      name: '/joinMeeting',
      page: () => const JoinMeetingScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/thankYou',
      page: () => const ThankYouScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/splash',
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/winngooSplash',
      page: () => WinngooSplash(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/videoPlayer',
      page: () => VideoPlayer(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/conference',
      page: () => VideoConferencePage(
            conferenceID: joinMeetingController.enterCode.text,
            userId: userId.toString(),
            userName: userName.toString(),
          ),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
];
