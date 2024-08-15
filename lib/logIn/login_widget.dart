import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:winggoo/common_file/getXcontroller.dart';

import '../common_file/functions.dart';
import '../common_file/widgets.dart';

logInWidget() {
  // final signInformKey = GlobalKey<FormState>();

  return Obx(
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
          height: 20,
        ),
        Column(
          children: [
            textField(
              label: "Email",
              hint: " ",
              prefixIcon: const Icon(
                Icons.mail,
                color: Colors.grey,
              ),
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                } else {
                  return null;
                }
              },
              controller: logInController.mailController,
              // focusNode: signInController.mailFocusNode,
              // onFieldSubmited: (val) {
              //   FocusScope.of(Get.context!)
              //       .requestFocus(signInController.passwordFocusNode);
              // }
            ),
            const SizedBox(
              height: 20,
            ),
            textField(
              label: "Password",
              hint: " ",
              obscureText: logInController.obsecure.value,
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    logInController.obsecure.value =
                        !logInController.obsecure.value;
                  },
                  icon: logInController.obsecure.value
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
                  return 'This field cannot be empty';
                } else {
                  return null;
                }
              },
              controller: logInController.passwordController,
              // focusNode: signInController.passwordFocusNode,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forget Password?",
              style:
                  TextStyle(fontSize: contentSize, fontWeight: FontWeight.w600),
            ).onTap(() {
              Get.toNamed("/forgotPassword");
              // Get.toNamed("/otp");
            }),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        buttonWidget(
          onPress: () {
            Get.toNamed("/homeScreen");
          },
          text: "SIGN IN",
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to our Winngoo Gala",
                style: TextStyle(fontSize: contentSize),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style: TextStyle(fontSize: contentSize),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offNamed("/signUp");
                    },
                    child: Text(
                      "Sign up here",
                      style:
                          TextStyle(color: primaryColor, fontSize: contentSize),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    ),
  );
}

///dummy

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
