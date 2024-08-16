import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EnterNewPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool passwordObsecure = true.obs;

  RxBool resetPasswordLoader = false.obs;

  RxBool confirmPasswordObsecure = true.obs;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  resetPassword() async {
    resetPasswordLoader.value = true;
    var headers = {'Content-Type': 'application/json'};
    print("1");
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://winngoogala.winngooconsultancy.in/api/reset-password'));

    print("2");

    request.body = json.encode({
      "token": "3213vIqvZlO6ebH7tGJXB2KiXUmYEl3oqdVKvAq8Ne",
      "email": emailController.text,
      "password": passwordController.text,
      "password_confirmation": confirmPasswordController.text
    });
    print("3");

    request.headers.addAll(headers);
    print("4");

    http.StreamedResponse response = await request.send();
    print("5");

    resetPasswordLoader.value = false;
    print("6");

    if (response.statusCode == 200) {
      print("api done");
      print(await response.stream.bytesToString());

      Get.offAllNamed("/signIn");
    } else {
      print("api failed");
      print(response.reasonPhrase);
    }
  }
}
