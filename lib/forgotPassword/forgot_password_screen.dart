import 'package:flutter/material.dart';
import 'package:winggoo/common_file/images.dart';

import 'forgot_password_Widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            forgotPasswordWidget()
          ],
        ),
      ),
    );
  }
}
