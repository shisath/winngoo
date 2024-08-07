import 'package:flutter/material.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/signIn/sign_in_widget.dart';

import '../common_file/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor, automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo(),
            headingContainer(widget: Image.asset("assets/login.png")),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: signInWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
