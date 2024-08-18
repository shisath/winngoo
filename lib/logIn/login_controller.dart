import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common_file/functions.dart';
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
    try {
      print(logInLoader.value);

      postMethod(
          endPoint: 'login',
          body: {
            "email": mailController.text,
            "password": passwordController.text,
          },
          route: "homeScreen",
          setLoader: (s) {
            logInLoader.value = s;
          });
    } catch (e) {
      print("Error in signInApi: $e");
      showSnackBarUsingGet(isBadReqested: true, msg: "Something went wrong.");
    }

    Future.delayed((const Duration(seconds: 2)), () {
      logInLoader.value = false;
    });
  }
}
