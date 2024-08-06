import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/widgets.dart';

signUpWidget() {
  final signUpformKey = GlobalKey<FormState>();
  return Form(
    key: signUpformKey,
    child: Obx(
      () => Column(
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
              label: "Full name",
              hint: "",
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your full name";
                } else {
                  return null;
                }
              },
              controller: signUpController.fullNameController,
              focusNode: signUpController.fullnameFocusNode,
              onFieldSubmited: (val) {
                FocusScope.of(Get.context!)
                    .requestFocus(signUpController.surnameFocusNode);
              }),
          const SizedBox(
            height: 10,
          ),
          textField(
              label: "Surname",
              hint: "Enter your sure name",
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your full name";
                } else {
                  return null;
                }
              },
              controller: signUpController.surNameController,
              focusNode: signUpController.surnameFocusNode,
              onFieldSubmited: (val) {
                FocusScope.of(Get.context!)
                    .requestFocus(signUpController.emailFocusNode);
              }),
          const SizedBox(
            height: 10,
          ),
          textField(
              label: "Email",
              hint: " ",
              prefixIcon: const Icon(
                Icons.mail,
                color: Colors.grey,
              ),
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                } else {
                  return null;
                }
              },
              controller: signUpController.emailController,
              focusNode: signUpController.emailFocusNode,
              onFieldSubmited: (val) {
                FocusScope.of(Get.context!)
                    .requestFocus(signUpController.confirmEmailFocusNode);
              }),
          const SizedBox(
            height: 10,
          ),
          textField(
              label: "Confirm email",
              hint: " ",
              prefixIcon: const Icon(
                Icons.mail,
                color: Colors.grey,
              ),
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your Email";
                } else {
                  return null;
                }
              },
              controller: signUpController.confirmEmailController,
              focusNode: signUpController.confirmEmailFocusNode,
              onFieldSubmited: (val) {
                FocusScope.of(Get.context!)
                    .requestFocus(signUpController.passwordFocusNode);
              }),
          const SizedBox(
            height: 10,
          ),
          textField(
              obscureText: signUpController.passwordObsecure.value,
              label: "Password",
              hint: "",
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    signUpController.passwordObsecure.value =
                        !signUpController.passwordObsecure.value;
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
                  return "Please enter your password";
                } else {
                  return null;
                }
              },
              controller: signUpController.yourPasswordController,
              focusNode: signUpController.passwordFocusNode,
              onFieldSubmited: (val) {
                FocusScope.of(Get.context!)
                    .requestFocus(signUpController.confirmPasswordFocusNode);
              }),
          const SizedBox(
            height: 10,
          ),
          textField(
              obscureText: signUpController.confirmObsecure.value,
              label: "Confirm password",
              hint: "",
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    signUpController.confirmObsecure.value =
                        !signUpController.confirmObsecure.value;
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
                  return 'This field cannot be empty';
                } else {
                  return null;
                }
              },
              controller: signUpController.confirmPasswordController,
              focusNode: signUpController.confirmPasswordFocusNode,
              onFieldSubmited: (val) {
                FocusScope.of(Get.context!)
                    .requestFocus(signUpController.mobileNumberFocusNode);
              }),
          const SizedBox(
            height: 10,
          ),
          textField(
              label: "Mobile No",
              hint: " ",
              prefixIcon: const Icon(
                Icons.phone,
                color: Colors.grey,
              ),
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return "Mobile number can't be empty";
                } else {
                  return null;
                }
              },
              controller: signUpController.phoneNumber,
              focusNode: signUpController.mobileNumberFocusNode,
              onFieldSubmited: (val) {
                FocusScope.of(Get.context!)
                    .requestFocus(signUpController.passwordFocusNode);
              }),
          Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    signUpController.sendOtp.value =
                        !signUpController.sendOtp.value;
                  },
                  child: signUpController.sendOtp.value
                      ? Text("ReSend OTP")
                      : Text("Send OTP"))),
          const SizedBox(
            height: 10,
          ),
          if (signUpController.sendOtp.value) ...[
            textField(
                label: "Enter OTP",
                hint: " ",
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Mobile number can't be empty";
                  } else {
                    return null;
                  }
                },
                controller: signUpController.enterOTPController,
                focusNode: signUpController.enterOTPFocusNode,
                onFieldSubmited: (val) {
                  FocusScope.of(Get.context!)
                      .requestFocus(signUpController.countryFocusNode);
                }),
            const SizedBox(
              height: 20,
            ),
          ],
          DropdownButtonFormField(
            items: const [
              DropdownMenuItem<String>(
                value: "sathish",
                child: Text("sathjosh"),
              )
            ],
            onChanged: (s) {
              signUpController.countryController.text = s!;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          buttonWidget(
            onPress: () {
              print("Name ${signUpController.fullNameController.text}");
              print("surename ${signUpController.surNameController.text}");
              print("email ${signUpController.emailController.text}");
              print(
                  "confirm mail ${signUpController.confirmEmailController.text}");
              print("password ${signUpController.yourPasswordController.text}");
              print(
                  "confirm password ${signUpController.confirmPasswordController.text}");
              print("Mobile No ${signUpController.phoneNumber.text}");
              print("country ${signUpController.countryController.text}");

              if (signUpformKey.currentState?.validate() == true) {
                signUpController.signUpApi();
              }
            },
            text: "SIGN UP",
          ),
          const SizedBox(
            height: 20,
          ),
          googelFacebook(
            text: "Sign In",
            ontap: () {
              print("Name ${signUpController.fullNameController.text}");
              print("surename ${signUpController.surNameController.text}");
              print("email ${signUpController.emailController.text}");
              print(
                  "confirm mail ${signUpController.confirmEmailController.text}");
              print("password ${signUpController.yourPasswordController.text}");
              print(
                  "confirm password ${signUpController.confirmPasswordController.text}");
              print("Mobile No ${signUpController.phoneNumber.text}");
              print("country ${signUpController.countryController.text}");
              // Get.offNamed("/signIn");
            },
          ),
        ],
      ),
    ),
  );
}

Widget googelFacebook({required void Function()? ontap, required String text}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // pngButton(
      //   onTap: () {},
      //   text: "Login with Google",
      //   png: Image.asset(
      //     googlePng,
      //     height: 60,
      //     width: 60,
      //   ),
      // ),
      // const SizedBox(
      //   height: 20,
      // ),
      // pngButton(
      //   onTap: () {},
      //   text: "Login with FaceBook",
      //   png: Image.asset(
      //     fbPng,
      //     height: 40,
      //     width: 60,
      //   ),
      // ),
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
