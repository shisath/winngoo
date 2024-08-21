import 'package:get/get.dart';

import '../JoinMeeting (enter your code)/join_meeting_controller.dart';
import '../LogIn/login_controller.dart';
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
import '../signup/signUp_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => OtpController());
    Get.lazyPut(() => ResetPasswordController());
    Get.lazyPut(() => ForgotPasswordController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AddEventController());
    Get.lazyPut(() => SheduleDateTimeController());
    Get.lazyPut(() => EnterNewPasswordController());
    Get.lazyPut(() => ChooseYourPlaneController());
    Get.lazyPut(() => PaymentController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => Documentcontroller());
    Get.lazyPut(() => JoinMeetingController());
  }
}

// void initializeControllers() {
//   // Initialize controllers
//   Get.lazyPut(() => LogInController());
//   Get.lazyPut(() => SignUpController());
//   Get.lazyPut(() => OtpController());
//   Get.lazyPut(() => ResetPasswordController());
//   Get.lazyPut(() => ForgotPasswordController());
//   Get.lazyPut(() => HomeController());
//   Get.lazyPut(() => AddEventController());
//   Get.lazyPut(() => SheduleDateTimeController());
//   Get.lazyPut(() => EnterNewPasswordController());
//   Get.lazyPut(() => ChooseYourPlaneController());
//   Get.lazyPut(() => PaymentController());
//   Get.lazyPut(() => ProfileController());
//   Get.lazyPut(() => Documentcontroller());
//   Get.lazyPut(() => JoinMeetingController());
// }

// Access controllers in the same file
final logInController = Get.find<LogInController>();
final signUpController = Get.find<SignUpController>();
final otpController = Get.find<OtpController>();
final resetPasswordController = Get.find<ResetPasswordController>();
final forgotPasswordController = Get.find<ForgotPasswordController>();
final homeController = Get.find<HomeController>();
final addEventController = Get.find<AddEventController>();
final sheduleDateTimeController = Get.find<SheduleDateTimeController>();
final enterNewPasswordController = Get.find<EnterNewPasswordController>();
final chooseYourPlaneController = Get.find<ChooseYourPlaneController>();
final paymentController = Get.find<PaymentController>();
final profileController = Get.find<ProfileController>();
final docController = Get.find<Documentcontroller>();
final joinMeetingController = Get.find<JoinMeetingController>();
