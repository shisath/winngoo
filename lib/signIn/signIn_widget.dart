import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';
import '../signup/signup_widget.dart';

Widget logo() {
  return Image.asset(
    winngoo,
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
              "Sign In",
              style: TextStyle(fontSize: headingSize),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              togleButton(
                  headingText: "Remeber Me",
                  controller: signInController.rememberMe.value,
                  onchanged: (bool) {
                    signInController.rememberMe.value = bool;
                  }),
              Text(
                "Forget Password?",
                style: TextStyle(fontSize: contentSize - 3),
              ).onTap(() {
                Get.toNamed("/otp");
              })
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          buttonWidget(
            onPress: () {
              if (signInformKey.currentState?.validate() == true) {
                Get.toNamed("/signUp");
              }
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
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
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
