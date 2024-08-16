import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:velocity_x/velocity_x.dart';

import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';

signUpWidget({required BuildContext context}) {
  final signUpformKey = GlobalKey<FormState>();
  return Form(
    key: signUpformKey,
    child: Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              textField(
                  context: context,
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
                  context: context,
                  label: "Surname",
                  hint: " ",
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
                  context: context,
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
                  context: context,
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
                  context: context,
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
                      icon: signUpController.passwordObsecure.value
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
                    FocusScope.of(Get.context!).requestFocus(
                        signUpController.confirmPasswordFocusNode);
                  }),
              const SizedBox(
                height: 10,
              ),
              textField(
                  context: context,
                  obscureText: signUpController.confirmPasswordObsecure.value,
                  label: "Confirm password",
                  hint: "",
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        signUpController.confirmPasswordObsecure.value =
                            !signUpController.confirmPasswordObsecure.value;
                      },
                      icon: signUpController.confirmPasswordObsecure.value
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
                  context: context,
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
                          ? const Text(
                              "RESEND OTP",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            )
                          : const Text("SEND OTP",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )))),
              const SizedBox(
                height: 10,
              ),
              if (signUpController.sendOtp.value) ...[
                Center(
                  child: SizedBox(
                    // height: 100,
                    width: 300,
                    child: PinCodeTextField(
                      onChanged: (a) {
                        signUpController.enterOTPController.text = a;
                      },
                      appContext: Get.context!,
                      animationDuration: const Duration(milliseconds: 300),
                      pinTheme: PinTheme(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          shape: PinCodeFieldShape.box,
                          fieldHeight: 50,
                          fieldWidth: 50,
                          disabledColor: Colors.grey,
                          selectedColor: primaryColor,
                          selectedFillColor: primaryColor?.withOpacity(0.5),
                          activeColor: primaryColor,
                          activeFillColor: primaryColor!.withOpacity(0.9)),
                      length: 4,
                    ),
                  ),
                ),
                // textField(
                //     label: "Enter OTP",
                //     hint: " ",
                //     prefixIcon: const Icon(
                //       Icons.lock_reset_outlined,
                //       color: Colors.grey,
                //     ),
                //     validate: (value) {
                //       if (value == null || value.isEmpty) {
                //         return "Mobile number can't be empty";
                //       } else {
                //         return null;
                //       }
                //     },
                //     controller: signUpController.enterOTPController,
                //     focusNode: signUpController.enterOTPFocusNode,
                //     onFieldSubmited: (val) {
                //       FocusScope.of(Get.context!)
                //           .requestFocus(signUpController.countryFocusNode);
                //     }),
                const SizedBox(
                  height: 15,
                ),
              ],
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: DropdownButtonFormField(
                    decoration: inputDecoration(
                        prefixIcon: const Icon(
                          Icons.account_balance_outlined,
                          color: Colors.grey,
                        ),
                        label: 'Country',
                        hint: '',
                        prefix: const Text("")),
                    items: const [
                      DropdownMenuItem<String>(
                        value: "India",
                        child: Text("India"),
                      ),
                      DropdownMenuItem<String>(
                        value: "UK",
                        child: Text("UK"),
                      ),
                    ],
                    onChanged: (s) {
                      signUpController.countryController.text = s!;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Checkbox(
                      value: signUpController.isChecked.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          signUpController.isChecked.value = value;
                        }

                        print(signUpController.isChecked.value);
                      },
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy policy & Accept terms and conditions",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: primaryColor,
                              fontSize: contentSize),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: buttonWidget(
                  isLoading: signUpController.signUpLoader.value,
                  onPress: () {
                    if (signUpformKey.currentState?.validate() == true) {
                      if (signUpController.isChecked.value != true) {
                        showSnackBarUsingGet(
                            msg:
                                'Please Accept Terms & Conditions and Policies',
                            isBadReqested: true);
                      } else {
                        signUpController.signUpApi();
                      }
                    }
                  },
                  text: "SIGN UP",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

///not use
Widget googelFacebook({required void Function()? ontap, required String text}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
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
      Text(
        text,
        style: TextStyle(fontSize: contentSize, color: secondarycolor),
      ).onTap(ontap)
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
