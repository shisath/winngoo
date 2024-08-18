import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/images.dart';

import '../common_file/getXcontroller.dart';
import '../common_file/widgets.dart';
import 'forgot_password_Widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        floatingActionButton: buttonWidget(
            isLoading: forgotPasswordController.loader.value,
            onPress: () {
              forgotPasswordController.forgotPassword();
            },
            text: "SEND"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  forgotPasswordPng,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                ),
              ),
              forgotPasswordWidget(context: context)
            ],
          ),
        ),
      ),
    );
  }
}
