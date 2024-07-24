import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/widgets.dart';

homeWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
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
            controller: homeController.emailController,
            focusNode: homeController.emailFocusNode,
            onFieldSubmited: (val) {
              FocusScope.of(Get.context!)
                  .requestFocus(signUpController.nameFocusNode);
            }),
        const SizedBox(
          height: 20,
        ),
        Text(
          "OR",
          style: TextStyle(fontSize: contentSize),
        ),
        const SizedBox(
          height: 20,
        ),
        textField(
            label: "Link",
            hint: "Eg.http//link.com",
            prefixIcon: const Icon(
              Icons.link_rounded,
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
          height: 80,
        ),
        buttonWidget(
            onPress: () {
              Get.toNamed("/addEventScreen");
            },
            text: "CREATE ROOM"),
        const SizedBox(
          height: 20,
        ),
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
