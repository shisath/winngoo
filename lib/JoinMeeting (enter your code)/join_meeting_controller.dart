import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class JoinMeetingController extends GetxController {
  TextEditingController enterCode = TextEditingController();
  TextEditingController enterLink = TextEditingController();

  final emailFocusNode = FocusNode();
  final linkFocusNode = FocusNode();
}
