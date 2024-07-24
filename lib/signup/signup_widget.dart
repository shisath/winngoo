import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';

signUpWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          "Sign Up",
          style: TextStyle(fontSize: headingSize),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      textField(
          label: "Full Name",
          hint: "Eg.Sathish",
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.grey,
          ),
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            } else {
              return null;
            }
          },
          controller: signUpController.fullNameController,
          focusNode: signUpController.nameFocusNode,
          onFieldSubmited: (val) {
            FocusScope.of(Get.context!)
                .requestFocus(signUpController.nameFocusNode);
          }),
      const SizedBox(
        height: 10,
      ),
      textField(
          label: "Email",
          hint: "Eg.sk@gmail.com",
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
          controller: signUpController.emailController,
          focusNode: signUpController.emailFocusNode,
          onFieldSubmited: (val) {
            FocusScope.of(Get.context!)
                .requestFocus(signUpController.nameFocusNode);
          }),
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
              onPressed: () {
                print("sk");
              },
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
          controller: signUpController.yourPasswordController,
          // focusNode: siController.mailFocusNode,
          onFieldSubmited: (val) {
            FocusScope.of(Get.context!)
                .requestFocus(signInController.passwordFocusNode);
          }),
      const SizedBox(
        height: 10,
      ),
      textField(
          label: "Confirm Password",
          hint: "",
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                print("sk");
              },
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
          controller: signUpController.yourPasswordController,
          // focusNode: siController.mailFocusNode,
          onFieldSubmited: (val) {
            FocusScope.of(Get.context!)
                .requestFocus(signInController.passwordFocusNode);
          }),
      const SizedBox(
        height: 20,
      ),
      buttonWidget(
        onPress: () {
          Get.toNamed("/otp");
        },
        text: "SIGN UP",
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
        text: "Sign In",
        ontap: () {
          Get.offNamed("/signIn");
        },
      ),
    ],
  );
}

Widget googelFacebook({required void Function()? ontap, required String text}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      pngButton(
        onTap: () {},
        text: "Login with Google",
        png: Image.asset(
          googlePng,
          height: 60,
          width: 60,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      pngButton(
        onTap: () {},
        text: "Login with FaceBook",
        png: Image.asset(
          fbPng,
          height: 40,
          width: 60,
        ),
      ),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(fontSize: contentSize),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(fontSize: contentSize, color: secondarycolor),
          ).onTap(ontap),
        ],
      )
    ],
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
