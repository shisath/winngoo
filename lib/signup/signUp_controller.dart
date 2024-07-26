import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController yourPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool passwordObsecure = true.obs;
  RxBool confirmObsecure = true.obs;

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
}
