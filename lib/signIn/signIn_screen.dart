import 'package:flutter/material.dart';
import 'package:winggoo/signIn/signIn_widget.dart';

import '../signup/signup_widget.dart';

final signInformKey = GlobalKey<FormState>();

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              logo(),
              signInWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
