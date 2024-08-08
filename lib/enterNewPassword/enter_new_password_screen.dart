import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/images.dart';

import '../common_file/widgets.dart';
import 'enter_new_password_Widget.dart';

class EnterNewPasswordScreen extends StatelessWidget {
  const EnterNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: buttonWidget(
          onPress: () {
            Get.offAllNamed("/signIn");
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
            enterNewPassword()
          ],
        ),
      ),
    );
  }
}
