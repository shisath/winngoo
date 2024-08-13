import 'package:get/get.dart';

import '../addEvent/addEvent_controller.dart';
import '../choose_your_plane/choose_your_plane_controller.dart';
import '../documents/documentController.dart';
import '../enterNewPassword/enter_new_password_controller.dart';
import '../forgotPassword/forgot_password_controller.dart';
import '../home/home_controller.dart';
import '../otp/otp_controller.dart';
import '../payment/payment_controller.dart';
import '../profile/profile_controller.dart';
import '../resetPassword/reset_password_controller.dart';
import '../shedule_date_time/shedule_date_time_controller.dart';
import '../signIn/sign_in_controller.dart';
import '../signup/signUp_controller.dart';

final signInController = Get.put(SignInController());
final signUpController = Get.put(SignUpController());
final otpController = Get.put(OtpController());
final resetPasswordController = Get.put(ResetPasswordController());
final forgotPasswordController = Get.put(ForgotPasswordController());
final homeController = Get.put(HomeController());
final addEventController = Get.put(AddEventController());
final sheduleDateTimeController = Get.put(SheduleDateTimeController());
final enterNewPasswordController = Get.put(EnterNewPasswordController());
final chooseYourPlaneConroller = Get.put(ChooseYourPlaneController());
final paymentController = Get.put(PaymentController());
final profileController = Get.put(ProfileController());
final docController = Get.put(Documentcontroller());
