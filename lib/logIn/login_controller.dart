import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common_file/widgets.dart';

class LogInController extends GetxController {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obsecure = true.obs;
  RxBool logInLoader = false.obs;

  RxBool rememberMe = false.obs;

  late FocusNode mailFocusNode = FocusNode();
  late FocusNode passwordFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    // Initialize your controllers and focus nodes
    mailController = TextEditingController();
    passwordController = TextEditingController();

    mailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    mailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  signInApi() async {
    logInLoader.value = true;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://winngoogala.winngooconsultancy.in/api/login'));
    request.body = json.encode(
        {"email": mailController.text, "password": passwordController.text});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    logInLoader.value = false;
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();

      var jsonResponse = jsonDecode(responseBody);
      String successMessage = jsonResponse["message"];

      showSnackBarUsingGet(isBadReqested: false, msg: successMessage);

      Get.toNamed("/homeScreen");
    } else {
      // logInLoader.value = false;
      String responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);
      print(jsonResponse);

      showSnackBarUsingGet(
          isBadReqested: true, msg: jsonResponse["errors"]["error"]);

      return;
    }
  }

  forgotPassword() async {
    // print("running");
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://winngoogala.winngooconsultancy.in/api/forgot-password'));
    request.body = json.encode(
      {
        "email": "sathishkumarpersonal07@gmail.com",
      },
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      Get.toNamed("/otp");
    } else {
      // print(response.reasonPhrase);
    }
  }
}
