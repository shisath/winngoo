import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class SignInController extends GetxController {
  var signInMailController = TextEditingController();
  var signInPasswordController = TextEditingController();
  RxBool obsecure = true.obs;
  RxBool rememberMe = false.obs;

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
}
