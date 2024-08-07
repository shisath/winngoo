import 'package:flutter/material.dart';
import 'package:winggoo/signup/signup_widget.dart';

final signUpformKey = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))],
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              signUpWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
