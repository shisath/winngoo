import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EnterNewPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool passwordObsecure = true.obs;
  RxBool confirmPasswordObsecure = true.obs;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
}
