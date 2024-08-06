import 'package:get/get.dart';

import '../addEvent/addEvent_controller.dart';
import '../home/home_controller.dart';
import '../otp/otp_controller.dart';
import '../resetPassword/reset_password_controller.dart';
import '../shedule_date_time/shedule_date_time_controller.dart';
import '../signIn/sign_in_controller.dart';
import '../signup/signUp_controller.dart';

final signInController = Get.put(SignInController());
final signUpController = Get.put(SignUpController());
final otpController = Get.put(OtpController());
final resetPasswordController = Get.put(ResetPasswordController());
final homeController = Get.put(HomeController());
final addEventController = Get.put(AddEventController());
final sheduleDateTimeController = Get.put(SheduleDateTimeController());
