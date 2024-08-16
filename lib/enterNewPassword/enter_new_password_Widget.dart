import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/widgets.dart';

Widget enterNewPassword({required BuildContext context}) {
  return Obx(
    () => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Enter New Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: headingSize),
        ),
        Text(
          "Your New password must contain atleast 8 characters with contains numbers, symbols, captial letters and alphabtes",
          style: TextStyle(fontSize: contentSize),
        ),
        textField(
            context: context,
            heading: "Enter email",
            label: "",
            hint: "",
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
            controller: enterNewPasswordController.emailController,
            focusNode: enterNewPasswordController.emailFocusNode,
            onFieldSubmited: (val) {
              FocusScope.of(Get.context!)
                  .requestFocus(enterNewPasswordController.passwordFocusNode);
            }),
        textField(
            context: context,
            obscureText: enterNewPasswordController.passwordObsecure.value,
            suffixIcon: IconButton(
                onPressed: () {
                  enterNewPasswordController.passwordObsecure.value =
                      !enterNewPasswordController.passwordObsecure.value;
                },
                icon: enterNewPasswordController.passwordObsecure.value
                    ? const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      )),
            heading: "Password",
            label: "",
            hint: "",
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              } else {
                return null;
              }
            },
            controller: enterNewPasswordController.passwordController,
            focusNode: enterNewPasswordController.passwordFocusNode,
            onFieldSubmited: (val) {
              FocusScope.of(Get.context!).requestFocus(
                  enterNewPasswordController.confirmPasswordFocusNode);
            }),
        textField(
            context: context,
            obscureText:
                enterNewPasswordController.confirmPasswordObsecure.value,
            suffixIcon: IconButton(
                onPressed: () {
                  enterNewPasswordController.confirmPasswordObsecure.value =
                      !enterNewPasswordController.confirmPasswordObsecure.value;
                },
                icon: enterNewPasswordController.confirmPasswordObsecure.value
                    ? const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      )),
            heading: "Confirm password",
            label: "",
            hint: "",
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cannot be empty';
              } else {
                return null;
              }
            },
            controller: enterNewPasswordController.confirmPasswordController,
            focusNode: enterNewPasswordController.confirmPasswordFocusNode,
            onFieldSubmited: (val) {
              // FocusScope.of(Get.context!).requestFocus(
              //     enterNewPasswordController.confirmPasswordFocusNode);
            }),
        const SizedBox(
          height: 90,
        )
      ]),
    ),
  );
}
