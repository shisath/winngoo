import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController yourPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController enterOTPController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  RxBool sendOtp = false.obs;

  RxBool passwordObsecure = true.obs;
  RxBool confirmObsecure = true.obs;

  final fullnameFocusNode = FocusNode();
  final surnameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final confirmEmailFocusNode = FocusNode();
  final mobileNumberFocusNode = FocusNode();
  final enterOTPFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final countryFocusNode = FocusNode();

  signUpApi() async {
    print("running");
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://winngoogala.winngooconsultancy.in/api/register'));
    request.body = json.encode({
      "first_name": fullNameController.text,
      "surname": surNameController.text,
      "email": emailController.text,
      "confirm_email": confirmEmailController.text,
      "mobile_number": phoneNumber.text,
      "country": "India",
      "agreement": true,
      "password": yourPasswordController.text,
      "password_confirmation": confirmPasswordController.text
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      print(await response.stream.bytesToString());

      Get.toNamed("/otp");
    } else {
      print(response.reasonPhrase);
    }
  }
}
