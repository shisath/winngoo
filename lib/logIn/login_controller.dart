import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winggoo/logIn/model/loginMode.dart';
import 'package:winggoo/logIn/model/membersData.dart';

import '../common_file/functions.dart';
import '../common_file/widgets.dart';

class LogInController extends GetxController {
  final GetStorage localStorage = GetStorage();

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString token = "".obs;

  RxBool obsecure = true.obs;
  RxBool logInLoader = false.obs;
  var loginApi = LoginData().obs;
  var membersApiData = MembersData().obs;
  RxBool rememberMe = false.obs;

  late FocusNode mailFocusNode = FocusNode();
  late FocusNode passwordFocusNode = FocusNode();

  cleaner() {
    mailController.text = "";
    passwordController.text = "";
  }

  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   // Initialize your controllers and focus nodes
  //   mailController = TextEditingController();
  //   passwordController = TextEditingController();
  //
  //   mailFocusNode = FocusNode();
  //   passwordFocusNode = FocusNode();
  // }

  // @override
  // void dispose() {
  //   mailFocusNode.dispose();
  //   passwordFocusNode.dispose();
  //   super.dispose();
  // }

  signInApi() async {
    try {
      print("sin in wrk 1");

      print(logInLoader.value);
      // final String? token = localStorage.read('api_token');
      dynamic res = await postMethod(
          success: (s) {},
          token: "",
          endPoint: 'login',
          body: {
            "email": mailController.text,
            "password": passwordController.text,
          },
          route: "homeScreen",
          isGetOff: true,
          setLoader: (s) {
            logInLoader.value = s;
          });
      print("sin in wrk 2");
      if (res.toString().isNotEmpty) {
        print("1");
        loginApi.value = loginValueData(res);

        print("2");
        localStorage.write('api_token', loginApi.value.data?.token);

        print("token res ${loginApi.value.data?.token}");
        await membersApi();
      }
    } catch (e) {
      print("Error in signInApi: $e");
      snackBar(isBadReqested: true, msg: "Something went wrong.");
    }

    Future.delayed((const Duration(seconds: 2)), () {
      logInLoader.value = false;
    });
  }

  membersApi() async {
    print("Members API");
    var res = await getMethod(
        endPoint: "members", setLoader: (s) {}, success: (s) {});
    if (res.toString().isNotEmpty) {
      membersApiData.value = membersData(res);
      localStorage.write('userId', membersApiData.value.data![0].user_id);
      localStorage.write('member_id', membersApiData.value.data![0].id);
      localStorage.write('userName', membersApiData.value.data![0].firstName);
      print('user Id ${membersApiData.value.data![0].user_id}');
    }
  }
}
