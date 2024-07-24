import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var signInMailController = TextEditingController();
  var signInPasswordController = TextEditingController();
  RxBool rememberMe = false.obs;

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
}
