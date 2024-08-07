import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../addEvent/addEvent_Screen.dart';
import '../forgotPassword/forgot_password_screen.dart';
import '../home/home_screen.dart';
import '../otp/otp_screen.dart';
import '../resetPassword/reset_password_screen.dart';
import '../shedule_date_time/shedule_date_time_Screen.dart';
import '../signIn/sign_in_screen.dart';
import '../signup/signUp_screen.dart';

final routes = [
  GetPage(
    name: '/signIn',
    page: () => SignInScreen(),
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
];
