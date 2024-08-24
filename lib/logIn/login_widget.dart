import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/widgets.dart';

logInWidget({required BuildContext context}) {
  final signInformKey = GlobalKey<FormState>();

  return Obx(
    () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LOG IN",
                style: TextStyle(
                    fontSize: headingSize, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: signInformKey,
          child: Column(
            children: [
              textField(
                context: context,
                label: "Email",
                hint: " ",
                prefixIcon: const Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
                validate: validateEmail,
                controller: logInController.mailController,
                // focusNode: logInController.mailFocusNode,
                // onFieldSubmited: (val) {
                //   WidgetsBinding.instance.addPostFrameCallback((_) {
                //     FocusScope.of(context)
                //         .requestFocus(logInController.passwordFocusNode);
                //   });
                // }
              ),
              const SizedBox(
                height: 20,
              ),
              textField(
                context: context,
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
                // focusNode: logInController.passwordFocusNode,
              ),
            ],
          ),
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
          isLoading: logInController.logInLoader.value,
          onPress: () {
            if (signInformKey.currentState!.validate()) {
              // Get.toNamed("/homeScreen");
              print("ssss");
              logInController.signInApi();
            } else {
              print("Form is not valid");
            }
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
                      signUpController.countryApi();
                    },
                    child: signUpController.signUpLoader.value
                        ? const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17.0),
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.red,
                                  strokeWidth: 3.0,
                                )),
                          )
                        : Text(
                            "Sign up",
                            style: TextStyle(
                                color: primaryColor, fontSize: contentSize),
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
