import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:winggoo/choose_your_plane/choose_your_plane_screen.dart';

import '../addEvent/addEvent_Screen.dart';
import '../documents/aboutUs_screen.dart';
import '../documents/privacyPolicy_screen.dart';
import '../documents/terms&cond_screen.dart';
import '../enterNewPassword/enter_new_password_screen.dart';
import '../forgotPassword/forgot_password_screen.dart';
import '../home/home_screen.dart';
import '../otp/otp_screen.dart';
import '../payment/payment_screen.dart';
import '../profile/profile_screen.dart';
import '../resetPassword/reset_password_screen.dart';
import '../shedule_date_time/shedule_date_time_Screen.dart';
import '../signIn/sign_in_screen.dart';
import '../signup/signUp_screen.dart';
import '../summary/summary_screen.dart';

final routes = [
  GetPage(
    name: '/signIn',
    page: () => const SignInScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/signUp',
    page: () => const SignUpScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/otp',
    page: () => const OtpScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/resetPassword',
    page: () => const ResetPasswordScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/forgotPassword',
    page: () => const ForgotPasswordScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/homeScreen',
    page: () => const HomeScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/addEventScreen',
    page: () => const AddEventScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/sheduleScreen',
    page: () => const SheduleDateAndTimeScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/enterNewPassword',
    page: () => const EnterNewPasswordScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/chooseYourPlane',
    page: () => const ChooseYourPlaneScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/summary',
    page: () => const SummaryScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/payment',
    page: () => const PaymentScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/profile',
    page: () => const ProfileScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/privacy',
    page: () => AboutUsScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/privacyPolicy',
    page: () => PrivacyPolicyScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/terms&cond',
    page: () => TermsAndConditionScreen(),
    transition: Transition.fadeIn,
  ),
];
