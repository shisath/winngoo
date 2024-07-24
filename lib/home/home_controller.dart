import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  final emailFocusNode = FocusNode();
  final linkFocusNode = FocusNode();
}
