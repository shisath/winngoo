import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../common_file/functions.dart';
import '../common_file/widgets.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController mailController = TextEditingController();
  final emailFocusNode = FocusNode();
  RxBool loader = false.obs;

  forgotPassword() async {
    try {
      postMethod(
          token: "",
          endPoint: 'forgot-password',
          body: {
            "email": mailController.text,
          },
          route: "otp",
          isGetOff: true,
          setLoader: (s) {
            loader.value = s;
          });
    } catch (e) {
      print("Error in signInApi: $e");
      showSnackBarUsingGet(isBadReqested: true, msg: "Something went wrong.");
    }
  }
}
