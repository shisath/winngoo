import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/images.dart';

import '../common_file/widgets.dart';
import 'enter_new_password_Widget.dart';

final resetPasswordFormKey = GlobalKey<FormState>();

class EnterNewPasswordScreen extends StatefulWidget {
  const EnterNewPasswordScreen({super.key});

  @override
  State<EnterNewPasswordScreen> createState() => _EnterNewPasswordScreenState();
}

class _EnterNewPasswordScreenState extends State<EnterNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        floatingActionButton: buttonWidget(
            isLoading: enterNewPasswordController.resetPasswordLoader.value,
            onPress: () {
              if (resetPasswordFormKey.currentState!.validate()) {
                // Get.toNamed("/homeScreen");
                enterNewPasswordController.resetPassword();
              } else {
                print("Form is not valid");
              }

              return;

              enterNewPasswordController.resetPassword();
            },
            text: "DONE"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  width: 200,
                  enterPasswordPng,
                  // height: MediaQuery.sizeOf(context).height * 0.4,
                ),
              ),
              enterNewPassword(context: context)
            ],
          ),
        ),
      ),
    );
  }
}
