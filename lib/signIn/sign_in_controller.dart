import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obsecure = true.obs;

  RxBool rememberMe = false.obs;

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  signInApi() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://winngoogala.winngooconsultancy.in/api/login'));
    request.body = json.encode(
        {"email": mailController.text, "password": passwordController.text});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      Get.toNamed("/homeScreen");
    } else {
      // print(response.reasonPhrase);
    }
  }

  forgotPassword() async {
    // print("running");
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://winngoogala.winngooconsultancy.in/api/forgot-password'));
    request.body = json.encode({"email": "sathishkumarpersonal07@gmail.com"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print("running123");

      // print(await response.stream.bytesToString());
      Get.toNamed("/otp");
    } else {
      // print(response.reasonPhrase);
    }
  }
}
