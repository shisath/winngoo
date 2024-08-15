import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/signup/signup_widget.dart';

import '../common_file/widgets.dart';
import '../common_file/winngoo_widgets/winngoo_drawer.dart';

final signUpformKey = GlobalKey<FormState>();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          headingContainer(
              context: context,
              widget: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconButton(
                        icon: Icons.arrow_back,
                        title: "SIGN UP",
                        onpress: () {
                          Get.back();
                        }),
                  ],
                ),
              ),
              height: 120.0),
          Expanded(child: signUpWidget()),
        ],
      ),
    );
  }
}
