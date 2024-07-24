import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/widgets.dart';

resetPasswordWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Reset Password",
        style: TextStyle(fontSize: headingSize),
      ),
      Text(
        "Please enter your email address \nto request a password reset",
        style: TextStyle(fontSize: contentSize),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: textField(
            label: "Email",
            hint: "Eg.sk@gmail.com",
            prefixIcon: const Icon(
              Icons.mail,
              color: Colors.grey,
            ),
            validate: (value) {
              if (value == null || value.isEmpty) {
                //   return 'This field cannot be empty';
                // } else {
                return null;
              }
            },
            controller: resetPasswordController.emailController,
            focusNode: signUpController.emailFocusNode,
            onFieldSubmited: (val) {
              // FocusScope.of(Get.context!)
              //     .requestFocus(signUpController.nameFocusNode);
            }),
      ),
      const Center(
        child: Text("OR"),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: textField(
            label: "Phone Number",
            hint: "",
            prefixIcon: const Icon(
              Icons.phone,
              color: Colors.grey,
            ),
            validate: (value) {
              if (value == null || value.isEmpty) {
                //   return 'This field cannot be empty';
                // } else {
                return null;
              }
            },
            controller: resetPasswordController.phoneNumberController,
            onFieldSubmited: (val) {}),
      ),
      SizedBox(
        height: 10,
      ),
      buttonWidget(
          onPress: () {
            Get.toNamed("/otp");
          },
          text: "SEND"),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}
