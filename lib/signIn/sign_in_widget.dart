import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';

///not use
Widget logo() {
  return Image.asset(
    winngooLogo,
    width: 400,
    height: 200,
  );
}

signInWidget() {
  final signInformKey = GlobalKey<FormState>();

  return Form(
    key: signInformKey,
    child: Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "LOG IN",
              style:
                  TextStyle(fontSize: headingSize, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          textField(
              label: "Email",
              hint: "Eg.winngoo@gmail.com",
              prefixIcon: const Icon(
                Icons.mail,
                color: Colors.grey,
              ),
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return "Gmail can't be empty";
                } else {
                  return null;
                }
              },
              controller: signInController.signInMailController,
              focusNode: signInController.mailFocusNode,
              onFieldSubmited: (val) {
                FocusScope.of(Get.context!)
                    .requestFocus(signInController.passwordFocusNode);
              }),
          const SizedBox(
            height: 10,
          ),
          textField(
              obscureText: signInController.obsecure.value,
              label: "Password",
              hint: "Your Password",
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    signInController.obsecure.value =
                        !signInController.obsecure.value;
                  },
                  icon: signInController.obsecure.value
                      ? const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        )),
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return "Password can't be empty";
                } else {
                  return null;
                }
              },
              controller: signInController.signInPasswordController,
              focusNode: signInController.passwordFocusNode,
              onFieldSubmited: (val) {
                // FocusScope.of(Get.context!)
                //     .requestFocus(signInController.passwordFocusNode);
              }),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password?",
                style: TextStyle(
                    fontSize: contentSize - 3, fontWeight: FontWeight.w600),
              ).onTap(() {
                Get.toNamed("/forgotPassword");
                // signInController.forgotPassword();
                // Get.toNamed("/otp");
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buttonWidget(
            onPress: () {
              Get.toNamed("/addEventScreen");

              // if (signInformKey.currentState?.validate() == true) {
              //   //
              //    signInController.signInApi();
              // }
            },
            text: "SIGN IN",
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "Welcome to our Winngoo Gala",
                  style: TextStyle(fontSize: contentSize),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Sign up here",
                  style: TextStyle(color: primaryColor, fontSize: contentSize),
                ).onTap(() {
                  Get.offNamed("/signUp");
                }),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    ),
  );
}

///not use
Widget pngButton({
  png,
  required String text,
  required void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        png,
        Text(
          text,
          style: TextStyle(fontSize: contentSize),
        )
      ],
    ),
  );
}
