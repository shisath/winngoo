import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common_file/widgets.dart';

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
  RxBool isChecked = false.obs;
  RxBool sendOtp = false.obs;
  RxBool signUpLoader = false.obs;

  RxBool passwordObsecure = true.obs;
  RxBool confirmPasswordObsecure = true.obs;

  final fullnameFocusNode = FocusNode();
  final surnameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final confirmEmailFocusNode = FocusNode();
  final mobileNumberFocusNode = FocusNode();
  final enterOTPFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final countryFocusNode = FocusNode();

  @override
  void dispose() {
    fullNameController.dispose();
    surNameController.dispose();
    emailController.dispose();
    confirmEmailController.dispose();
    phoneNumber.dispose();
    yourPasswordController.dispose();
    confirmPasswordController.dispose();
    enterOTPController.dispose();
    countryController.dispose();
    fullnameFocusNode.dispose();
    surnameFocusNode.dispose();
    emailFocusNode.dispose();
    confirmEmailFocusNode.dispose();
    mobileNumberFocusNode.dispose();
    enterOTPFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    countryFocusNode.dispose();
    super.dispose();
  }

  signUpApi() async {
    signUpLoader.value = true;
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
    signUpLoader.value = false;
    if (response.statusCode == 201) {
      String responseBody = await response.stream.bytesToString();

      var jsonResponse = jsonDecode(responseBody);
      String successMessage = jsonResponse["message"];

      snackBar(isBadReqested: false, msg: successMessage);

      Get.toNamed("/signIn");
    } else {
      String responseBody = await response.stream.bytesToString();
      final responseJson = json.decode(responseBody);
      if (responseJson.containsKey('errors')) {
        final errors = responseJson['errors'];

        // Access the specific errors and display them
        if (errors.containsKey('email')) {
          final emailError =
              errors['email'][0]; // Access the first error message for email
          snackBar(isBadReqested: true, msg: emailError);
        }

        if (errors.containsKey('confirm_email')) {
          final confirmEmailError = errors['confirm_email']
              [0]; // Access the first error message for confirm email
          snackBar(isBadReqested: true, msg: confirmEmailError);
        }
      }
    }
  }
}
