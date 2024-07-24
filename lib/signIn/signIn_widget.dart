import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';
import '../signup/signup_widget.dart';

Widget logo() {
  return Image.asset(
    googlePng,
    width: 300,
    height: 200,
  );
}

signInWidget() {
  return Obx(
    () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Sign In",
            style: TextStyle(fontSize: headingSize),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        textField(
          label: "Email",
          hint: "abc@email.com",
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
          controller: signInController.signInMailController,
          focusNode: signInController.mailFocusNode,
          onFieldSubmited: (val) {
            FocusScope.of(Get.context!)
                .requestFocus(signInController.passwordFocusNode);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        textField(
            label: "Password",
            hint: "Your Password",
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                )),
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              } else {
                return null;
              }
            },
            controller: signInController.signInPasswordController,
            // focusNode: siController.mailFocusNode,
            onFieldSubmited: (val) {
              FocusScope.of(Get.context!)
                  .requestFocus(signInController.passwordFocusNode);
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            togleButton(
                headingText: "Remeber Me",
                controller: signInController.rememberMe.value,
                onchanged: (bool) {
                  signInController.rememberMe.value = bool;
                  print(bool);
                }),
            TextButton(
                onPressed: () {
                  Get.offNamed("/resetPassword");
                },
                child: Text(
                  "Forget Password?asfssss",
                  style: TextStyle(fontSize: contentSize),
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        buttonWidget(
          onPress: () {
            Get.toNamed("/signUp");
          },
          text: "SIGN IN",
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "OR",
            style: TextStyle(color: Colors.grey, fontSize: contentSize),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        googelFacebook(
            text: "Sign Up",
            ontap: () {
              Get.offNamed("/signUp");
            })
      ],
    ),
  );
}

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
